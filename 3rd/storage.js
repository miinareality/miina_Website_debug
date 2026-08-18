/* =========================================================
   3rd/storage.js
   LocalStorage + Supabase user data synchronization

   LocalStorage is the browser-side cache.
   Supabase is the account-based shared storage.
   ========================================================= */
(() => {
    const BASE_KEYS = [
        "miina_memo",
        "miina_dice_results",
        "miina_dice_history"
    ];

    const CLOUD_TABLE = "miina_user_storage";
    const CLOUD_DATA_KEY = "data";

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

    function moveLegacyKeysToGuest() {
        for (const baseKey of BASE_KEYS) {
            const oldValue = read(baseKey);
            const key = guestKey(baseKey);
            if (oldValue !== null && read(key) === null) write(key, oldValue);
            if (oldValue !== null) remove(baseKey);
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

    async function getUser() {
        if (!window.MiinaAuth) return null;
        return await MiinaAuth.getCurrentUser();
    }

    async function migrateGuestToUser(user) {
        if (!user?.id) return false;
        moveLegacyKeysToGuest();

        for (const baseKey of BASE_KEYS) {
            const gKey = guestKey(baseKey);
            const uKey = userKey(baseKey, user.id);
            const guestValue = read(gKey);
            const userValue = read(uKey);

            if (guestValue === null) continue;

            if (baseKey === "miina_memo") {
                if (userValue === null || userValue === "") write(uKey, guestValue);
            } else {
                const guestArray = parseJson(guestValue, []);
                const userArray = parseJson(userValue, []);
                const max = baseKey === "miina_dice_results" ? 10 : 3;
                const merged = uniqueArray([...userArray, ...guestArray], max);
                write(uKey, JSON.stringify(merged));
            }

            remove(gKey);
        }
        return true;
    }

    function localDataForUser(userId) {
        return {
            memo: read(userKey("miina_memo", userId)) || "",
            dice_results: parseJson(read(userKey("miina_dice_results", userId)), []),
            dice_history: parseJson(read(userKey("miina_dice_history", userId)), [])
        };
    }

    function applyCloudData(userId, data) {
        if (!data || typeof data !== "object") return;

        const memo = typeof data.memo === "string" ? data.memo : "";
        const results = Array.isArray(data.dice_results) ? data.dice_results.slice(0, 10) : [];
        const history = Array.isArray(data.dice_history) ? data.dice_history.filter(v => typeof v === "string").slice(0, 3) : [];

        write(userKey("miina_memo", userId), memo);
        write(userKey("miina_dice_results", userId), JSON.stringify(results));
        write(userKey("miina_dice_history", userId), JSON.stringify(history));
    }

    async function getClient() {
        if (!window.MiinaAuth) throw new Error("MiinaAuthが読み込まれていません。");
        return await MiinaAuth.getSupabaseClient();
    }

    async function pullFromCloud(user) {
        if (!user?.id) return null;

        const client = await getClient();
        const { data, error } = await client
            .from(CLOUD_TABLE)
            .select(CLOUD_DATA_KEY)
            .eq("user_id", user.id)
            .maybeSingle();

        if (error) throw error;
        return data?.data ?? null;
    }

    async function pushToCloud(user, data = null) {
        if (!user?.id) return false;

        const client = await getClient();
        const payload = data || localDataForUser(user.id);

        const { error } = await client
            .from(CLOUD_TABLE)
            .upsert({
                user_id: user.id,
                data: payload,
                updated_at: new Date().toISOString()
            }, { onConflict: "user_id" });

        if (error) throw error;
        return true;
    }

    async function syncAll() {
        moveLegacyKeysToGuest();
        const user = await getUser();
        if (!user?.id) return { loggedIn: false };

        await migrateGuestToUser(user);

        let cloudData = null;
        try {
            cloudData = await pullFromCloud(user);
        } catch (error) {
            // SQL未実行などでクラウド側がまだ使えなくても、LocalStorageは利用できる。
            console.warn("Supabase同期を取得できませんでした。LocalStorageを継続使用します。", error);
            return { loggedIn: true, cloudAvailable: false, user };
        }

        const local = localDataForUser(user.id);

        if (cloudData === null) {
            await pushToCloud(user, local);
            return { loggedIn: true, cloudAvailable: true, direction: "local-to-cloud", user };
        }

        // クラウドに存在するデータを基本優先し、履歴系だけは安全に統合する。
        const mergedResults = uniqueArray(
            [...(Array.isArray(cloudData.dice_results) ? cloudData.dice_results : []), ...local.dice_results],
            10
        );
        const mergedHistory = uniqueArray(
            [...(Array.isArray(cloudData.dice_history) ? cloudData.dice_history : []), ...local.dice_history],
            3
        );

        const merged = {
            memo: typeof cloudData.memo === "string" ? cloudData.memo : local.memo,
            dice_results: mergedResults,
            dice_history: mergedHistory
        };

        applyCloudData(user.id, merged);
        await pushToCloud(user, merged);

        return { loggedIn: true, cloudAvailable: true, direction: "cloud-to-local", user };
    }

    async function save(baseKey, value) {
        moveLegacyKeysToGuest();
        const user = await getUser();
        const key = userKey(baseKey, user?.id);
        const saved = write(key, value);

        if (saved && user?.id) {
            try {
                await pushToCloud(user);
            } catch (error) {
                console.warn("クラウド同期に失敗しました。LocalStorageには保存されています。", error);
            }
        }
        return saved;
    }

    async function removeAndSync(baseKey) {
        moveLegacyKeysToGuest();
        const user = await getUser();
        remove(userKey(baseKey, user?.id));

        if (user?.id) {
            try {
                await pushToCloud(user);
            } catch (error) {
                console.warn("削除内容のクラウド同期に失敗しました。", error);
            }
        }
    }

    function getScopedKey(baseKey, userId = null) {
        moveLegacyKeysToGuest();
        return userKey(baseKey, userId);
    }

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
})();
