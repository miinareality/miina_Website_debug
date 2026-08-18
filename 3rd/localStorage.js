/*
 * =========================================================
 * 3rd/localStorage.js
 * Miina Website
 *
 * LocalStorage <-> Supabase user storage
 *
 * 役割:
 * ・未ログイン時はゲスト用LocalStorageを使用
 * ・ログイン後はユーザーIDごとのLocalStorage領域を使用
 * ・ログイン時にゲストデータとクラウドデータを同期
 * ・保存/削除時にSupabaseへ反映
 *
 * 注意:
 * Supabase Authが使用する認証トークンなどは同期しません。
 * 同期対象は、このファイルで定義したWebサイト用データだけです。
 * =========================================================
 */
(() => {
    "use strict";

    const CLOUD_TABLE = "miina_user_storage";

    /*
     * 現在のサイトでLocalStorageを使用しているキー。
     * 新しいLocalStorage項目を同期したい場合はここへ追加してください。
     */
    const BASE_KEYS = [
        "miina_memo",
        "miina_dice_results",
        "miina_dice_history"
    ];

    function guestKey(baseKey) {
        return `${baseKey}_guest`;
    }

    function userKey(baseKey, userId) {
        return userId ? `${baseKey}_${userId}` : guestKey(baseKey);
    }

    function read(key) {
        try {
            return localStorage.getItem(key);
        } catch (error) {
            console.error("LocalStorageの読み込みに失敗しました:", error);
            return null;
        }
    }

    function write(key, value) {
        try {
            localStorage.setItem(key, value);
            return true;
        } catch (error) {
            console.error("LocalStorageへの保存に失敗しました:", error);
            return false;
        }
    }

    function remove(key) {
        try {
            localStorage.removeItem(key);
            return true;
        } catch (error) {
            console.error("LocalStorageの削除に失敗しました:", error);
            return false;
        }
    }

    function parseJson(value, fallback) {
        if (value === null || value === "") return fallback;

        try {
            return JSON.parse(value);
        } catch (_) {
            return fallback;
        }
    }

    function uniqueArray(values, maxItems) {
        const result = [];

        for (const value of values) {
            if (!result.some(item => JSON.stringify(item) === JSON.stringify(value))) {
                result.push(value);
            }

            if (result.length >= maxItems) break;
        }

        return result;
    }

    /*
     * 旧形式のキーが残っている場合だけゲスト領域へ移動。
     * Authのキーなど、BASE_KEYSにないキーには触れません。
     */
    function moveLegacyKeysToGuest() {
        for (const baseKey of BASE_KEYS) {
            const oldValue = read(baseKey);
            const guest = guestKey(baseKey);

            if (oldValue !== null && read(guest) === null) {
                write(guest, oldValue);
            }

            if (oldValue !== null) {
                remove(baseKey);
            }
        }
    }

    async function getUser() {
        if (!window.MiinaAuth) return null;
        return await MiinaAuth.getCurrentUser();
    }

    /*
     * 未ログイン時に作ったゲストデータを、
     * ログインしたユーザーの領域へ移す。
     */
    async function migrateGuestToUser(user) {
        if (!user?.id) return false;

        moveLegacyKeysToGuest();

        for (const baseKey of BASE_KEYS) {
            const guest = guestKey(baseKey);
            const userKeyName = userKey(baseKey, user.id);

            const guestValue = read(guest);
            const userValue = read(userKeyName);

            if (guestValue === null) continue;

            if (baseKey === "miina_memo") {
                if (userValue === null || userValue === "") {
                    write(userKeyName, guestValue);
                }
            } else {
                const guestArray = parseJson(guestValue, []);
                const userArray = parseJson(userValue, []);

                const maxItems =
                    baseKey === "miina_dice_results" ? 10 : 3;

                const merged = uniqueArray(
                    [...userArray, ...guestArray],
                    maxItems
                );

                write(userKeyName, JSON.stringify(merged));
            }

            remove(guest);
        }

        return true;
    }

    /*
     * 現在ユーザーのLocalStorageデータを
     * Supabaseのdata列に入れる形式へ変換。
     */
    function localDataForUser(userId) {
        return {
            memo: read(userKey("miina_memo", userId)) || "",
            dice_results: parseJson(
                read(userKey("miina_dice_results", userId)),
                []
            ),
            dice_history: parseJson(
                read(userKey("miina_dice_history", userId)),
                []
            )
        };
    }

    function applyCloudData(userId, data) {
        if (!data || typeof data !== "object") return;

        const memo =
            typeof data.memo === "string"
                ? data.memo
                : "";

        const results =
            Array.isArray(data.dice_results)
                ? data.dice_results.slice(0, 10)
                : [];

        const history =
            Array.isArray(data.dice_history)
                ? data.dice_history
                    .filter(value => typeof value === "string")
                    .slice(0, 3)
                : [];

        write(
            userKey("miina_memo", userId),
            memo
        );

        write(
            userKey("miina_dice_results", userId),
            JSON.stringify(results)
        );

        write(
            userKey("miina_dice_history", userId),
            JSON.stringify(history)
        );
    }

    async function getClient() {
        if (!window.MiinaAuth) {
            throw new Error("MiinaAuthが読み込まれていません。");
        }

        return await MiinaAuth.getSupabaseClient();
    }

    /*
     * Supabase → LocalStorage
     */
    async function pullFromCloud(user) {
        if (!user?.id) return null;

        const client = await getClient();

        const { data, error } = await client
            .from(CLOUD_TABLE)
            .select("data")
            .eq("user_id", user.id)
            .maybeSingle();

        if (error) throw error;

        return data?.data ?? null;
    }

    /*
     * LocalStorage → Supabase
     */
    async function pushToCloud(user, data = null) {
        if (!user?.id) return false;

        const client = await getClient();

        const payload =
            data || localDataForUser(user.id);

        const { error } = await client
            .from(CLOUD_TABLE)
            .upsert(
                {
                    user_id: user.id,
                    data: payload,
                    updated_at: new Date().toISOString()
                },
                {
                    onConflict: "user_id"
                }
            );

        if (error) throw error;

        return true;
    }

    /*
     * ログイン時のメイン同期処理。
     *
     * 1. ゲストデータをユーザー領域へ移動
     * 2. Supabaseからユーザーデータを取得
     * 3. 初回ならLocalStorage → Supabase
     * 4. 既存ならクラウドと履歴を統合
     * 5. LocalStorageへ反映
     */
    let syncPromise = null;

    async function syncAll() {
        if (syncPromise) return await syncPromise;

        syncPromise = (async () => {
            moveLegacyKeysToGuest();

            const user = await getUser();

            if (!user?.id) {
                return {
                    loggedIn: false,
                    cloudAvailable: false
                };
            }

            await migrateGuestToUser(user);

            let cloudData = null;

            try {
                cloudData = await pullFromCloud(user);
            } catch (error) {
                /*
                 * SQL未実行・通信エラー等でも、
                 * LocalStorage自体はそのまま利用できるようにする。
                 */
                console.warn(
                    "Supabase同期を取得できませんでした。LocalStorageを継続使用します。",
                    error
                );

                return {
                    loggedIn: true,
                    cloudAvailable: false,
                    user
                };
            }

            const local = localDataForUser(user.id);

            /*
             * 初めてログインしたユーザー。
             */
            if (cloudData === null) {
                await pushToCloud(user, local);

                return {
                    loggedIn: true,
                    cloudAvailable: true,
                    direction: "local-to-cloud",
                    user
                };
            }

            /*
             * 既存ユーザー。
             * メモはクラウド優先。
             * ダイス履歴はクラウドとLocalStorageを統合。
             */
            const mergedResults = uniqueArray(
                [
                    ...(Array.isArray(cloudData.dice_results)
                        ? cloudData.dice_results
                        : []),
                    ...local.dice_results
                ],
                10
            );

            const mergedHistory = uniqueArray(
                [
                    ...(Array.isArray(cloudData.dice_history)
                        ? cloudData.dice_history
                        : []),
                    ...local.dice_history
                ],
                3
            );

            const merged = {
                memo:
                    typeof cloudData.memo === "string"
                        ? cloudData.memo
                        : local.memo,

                dice_results: mergedResults,
                dice_history: mergedHistory
            };

            applyCloudData(user.id, merged);
            await pushToCloud(user, merged);

            return {
                loggedIn: true,
                cloudAvailable: true,
                direction: "cloud-to-local",
                user
            };
        })();

        try {
            return await syncPromise;
        } finally {
            syncPromise = null;
        }
    }

    /*
     * 個別保存。
     * ログイン中なら同時にSupabaseへ保存。
     */
    async function save(baseKey, value) {
        if (!BASE_KEYS.includes(baseKey)) {
            console.warn(
                `同期対象外のLocalStorageキーです: ${baseKey}`
            );
        }

        moveLegacyKeysToGuest();

        const user = await getUser();
        const key = userKey(baseKey, user?.id);

        const saved = write(key, value);

        if (saved && user?.id) {
            try {
                await pushToCloud(user);
            } catch (error) {
                console.warn(
                    "クラウド同期に失敗しました。LocalStorageには保存されています。",
                    error
                );
            }
        }

        return saved;
    }

    async function removeAndSync(baseKey) {
        moveLegacyKeysToGuest();

        const user = await getUser();
        const key = userKey(baseKey, user?.id);

        remove(key);

        if (user?.id) {
            try {
                await pushToCloud(user);
            } catch (error) {
                console.warn(
                    "削除内容のクラウド同期に失敗しました。",
                    error
                );
            }
        }
    }

    function getScopedKey(baseKey, userId = null) {
        moveLegacyKeysToGuest();
        return userKey(baseKey, userId);
    }

    /*
     * login.htmlなどから明示的に呼ぶためのAPI。
     */
    window.MiinaLocalStorageSync = {
        get: () => {
            const data = {};

            for (const baseKey of BASE_KEYS) {
                data[baseKey] = read(
                    getScopedKey(baseKey)
                );
            }

            return data;
        },

        restore: syncAll,
        save: async () => {
            const user = await getUser();

            if (!user?.id) return false;

            return await pushToCloud(
                user,
                localDataForUser(user.id)
            );
        },

        syncAll
    };

    /*
     * 既存のdice-storage.js / memo.jsが使っている
     * MiinaStorage APIもここから提供する。
     *
     * これによりstorage.jsへの依存をなくせる。
     */
    window.MiinaStorage = {
        BASE_KEYS,
        guestKey,
        userKey,
        getScopedKey,
        read,
        write,
        remove,
        getUser,
        migrateGuestToUser,
        localDataForUser,
        pullFromCloud,
        pushToCloud,
        syncAll,
        save,
        removeAndSync
    };

    /*
     * ページを開いた時点ですでにログイン済みなら同期。
     * ログイン成功時にも同期。
     *
     * login.jsから明示的にsyncAll()を呼んだ場合も
     * syncPromiseで二重実行を防ぐ。
     */
    if (window.MiinaAuth?.watchAuthState) {
        MiinaAuth.watchAuthState((event, session) => {
            if (
                event === "INITIAL_SESSION" ||
                event === "SIGNED_IN"
            ) {
                /*
                 * Supabaseの認証イベントコールバック内で
                 * awaitして認証APIを再度呼ばないようにする。
                 */
                setTimeout(() => {
                    syncAll().catch(error => {
                        console.error(
                            "LocalStorage同期でエラーが発生しました:",
                            error
                        );
                    });
                }, 0);
            }
        }).catch(error => {
            console.error(
                "認証状態監視の開始に失敗しました:",
                error
            );
        });
    }

    console.log(
        "Miina LocalStorage 同期システム読み込み完了"
    );
})();
