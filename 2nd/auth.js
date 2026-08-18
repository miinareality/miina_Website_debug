/* =========================================================
   auth.js
   Supabase authentication core.
   Login UI is handled by login.js / login.html.
   Debug account status is handled by debug-auth.js.
   ========================================================= */

const SUPABASE_URL = "https://xbactiinrfyjdixdlquq.supabase.co";
const SUPABASE_PUBLISHABLE_KEY = "sb_publishable_suDqy2nOQ2nd616qIhR2hg_sX-_2Anc";
const AUTH_REDIRECT_URL = "https://miinareality.github.io/miina_website/2nd/login.html";

let supabaseClient = null;
let supabaseLoadPromise = null;

function loadSupabase() {
    if (window.supabase?.createClient) return Promise.resolve(window.supabase);
    if (supabaseLoadPromise) return supabaseLoadPromise;

    supabaseLoadPromise = new Promise((resolve, reject) => {
        const existing = document.querySelector('script[data-miina-supabase="true"]');
        if (existing) {
            existing.addEventListener("load", () => resolve(window.supabase), { once: true });
            existing.addEventListener("error", () => reject(new Error("Supabaseライブラリを読み込めませんでした。")), { once: true });
            return;
        }

        const script = document.createElement("script");
        script.src = "https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2";
        script.async = true;
        script.dataset.miinaSupabase = "true";
        script.onload = () => {
            if (window.supabase?.createClient) resolve(window.supabase);
            else reject(new Error("Supabaseライブラリを読み込めませんでした。"));
        };
        script.onerror = () => reject(new Error("Supabaseライブラリを読み込めませんでした。"));
        document.head.appendChild(script);
    });

    return supabaseLoadPromise;
}

async function initializeSupabase() {
    if (supabaseClient) return supabaseClient;

    const lib = await loadSupabase();
    supabaseClient = lib.createClient(SUPABASE_URL, SUPABASE_PUBLISHABLE_KEY);
    return supabaseClient;
}

async function getCurrentSession() {
    const client = await initializeSupabase();
    const { data, error } = await client.auth.getSession();
    if (error) throw error;
    return data.session ?? null;
}

async function signIn(email, password) {
    const client = await initializeSupabase();
    const { data, error } = await client.auth.signInWithPassword({ email, password });
    if (error) throw error;
    return data;
}

async function signUp(email, password) {
    const client = await initializeSupabase();
    const { data, error } = await client.auth.signUp({
        email,
        password,
        options: { emailRedirectTo: AUTH_REDIRECT_URL }
    });
    if (error) throw error;
    return data;
}

async function resendSignupConfirmation(email) {
    const client = await initializeSupabase();
    const { error } = await client.auth.resend({
        type: "signup",
        email,
        options: { emailRedirectTo: AUTH_REDIRECT_URL }
    });
    if (error) throw error;
}

async function signOut() {
    const client = await initializeSupabase();
    const { error } = await client.auth.signOut();
    if (error) throw error;
}

async function watchAuthState(callback) {
    const client = await initializeSupabase();
    return client.auth.onAuthStateChange(callback);
}

function formatAuthError(error) {
    const message = String(error?.message || error || "");
    const lower = message.toLowerCase();

    if (lower.includes("email not confirmed")) {
        return "メールアドレスの認証が完了していません。確認メールをご確認ください。";
    }
    if (lower.includes("invalid login credentials")) {
        return "メールアドレスまたはパスワードが正しくありません。";
    }
    if (lower.includes("user already registered") || lower.includes("already registered")) {
        return "このメールアドレスはすでに登録されています。";
    }
    if (lower.includes("password") && (lower.includes("short") || lower.includes("least") || lower.includes("characters"))) {
        return "パスワードの条件を満たしていません。";
    }
    if (lower.includes("failed to fetch") || lower.includes("network")) {
        return "Supabaseへ接続できませんでした。通信状態を確認してください。";
    }
    return "認証処理でエラーが発生しました。もう一度お試しください。";
}


/* =========================================================
   LocalStorage ユーザー別管理
   ・未ログイン時: <baseKey>_guest
   ・ログイン時:   <baseKey>_<Supabase user.id>
   ・既存の旧キー(<baseKey>)は初回アクセス/ログイン時に移行
   ========================================================= */

const LOCAL_STORAGE_BASE_KEYS = [
    "miina_memo",
    "miina_dice_results",
    "miina_dice_history"
];

function getGuestStorageKey(baseKey) {
    return `${baseKey}_guest`;
}

function getUserStorageKey(baseKey, userId) {
    if (!userId) return getGuestStorageKey(baseKey);
    return `${baseKey}_${userId}`;
}

function getScopedStorageKey(baseKey, userId = null) {
    try {
        // 旧バージョンのキーが残っている場合は、まずゲスト用へ移動。
        const legacyValue = localStorage.getItem(baseKey);
        const guestKey = getGuestStorageKey(baseKey);
        if (legacyValue !== null && localStorage.getItem(guestKey) === null) {
            localStorage.setItem(guestKey, legacyValue);
        }
        if (legacyValue !== null) {
            localStorage.removeItem(baseKey);
        }
    } catch (error) {
        console.error("LocalStorageキーの移行に失敗しました:", error);
    }

    return userId ? getUserStorageKey(baseKey, userId) : getGuestStorageKey(baseKey);
}

function readLocalValue(key) {
    try {
        return localStorage.getItem(key);
    } catch (error) {
        console.error("LocalStorageの読み込みに失敗しました:", error);
        return null;
    }
}

function writeLocalValue(key, value) {
    try {
        localStorage.setItem(key, value);
        return true;
    } catch (error) {
        console.error("LocalStorageへの保存に失敗しました:", error);
        return false;
    }
}

function removeLocalValue(key) {
    try {
        localStorage.removeItem(key);
        return true;
    } catch (error) {
        console.error("LocalStorageの削除に失敗しました:", error);
        return false;
    }
}

function mergeJsonArrays(userValue, guestValue, maxItems, itemValidator = () => true) {
    const parse = (value) => {
        if (value === null) return [];
        try {
            const data = JSON.parse(value);
            return Array.isArray(data) ? data.filter(itemValidator) : [];
        } catch (_) {
            return [];
        }
    };

    const merged = [];
    for (const item of [...parse(userValue), ...parse(guestValue)]) {
        const duplicate = merged.some(existing => JSON.stringify(existing) === JSON.stringify(item));
        if (!duplicate) merged.push(item);
        if (merged.length >= maxItems) break;
    }
    return merged;
}

async function migrateGuestLocalStorageToUser(user) {
    if (!user?.id) return false;

    const userId = user.id;

    try {
        for (const baseKey of LOCAL_STORAGE_BASE_KEYS) {
            // 旧キーが残っていれば、まずゲストキーへ移す。
            const guestKey = getScopedStorageKey(baseKey);
            const userKey = getUserStorageKey(baseKey, userId);
            const guestValue = readLocalValue(guestKey);
            const userValue = readLocalValue(userKey);

            if (baseKey === "miina_memo") {
                // メモは既存のユーザーデータを優先。ユーザーデータが空ならゲストメモを引き継ぐ。
                if ((userValue === null || userValue === "") && guestValue !== null) {
                    writeLocalValue(userKey, guestValue);
                }
            } else if (baseKey === "miina_dice_results") {
                const merged = mergeJsonArrays(userValue, guestValue, 10);
                if (merged.length > 0 || userValue !== null || guestValue !== null) {
                    writeLocalValue(userKey, JSON.stringify(merged));
                }
            } else if (baseKey === "miina_dice_history") {
                const merged = mergeJsonArrays(
                    userValue,
                    guestValue,
                    3,
                    item => typeof item === "string"
                );
                if (merged.length > 0 || userValue !== null || guestValue !== null) {
                    writeLocalValue(userKey, JSON.stringify(merged));
                }
            }

            // ログイン後に他ユーザーへ漏れないよう、ゲスト領域は空にする。
            if (guestValue !== null) removeLocalValue(guestKey);
        }

        return true;
    } catch (error) {
        console.error("ログイン後のLocalStorage移行に失敗しました:", error);
        return false;
    }
}

async function getCurrentUser() {
    const session = await getCurrentSession();
    return session?.user ?? null;
}

window.MiinaAuth = {
    initializeSupabase,
    getCurrentSession,
    getCurrentUser,
    getGuestStorageKey,
    getUserStorageKey,
    getScopedStorageKey,
    migrateGuestLocalStorageToUser,
    signIn,
    signUp,
    resendSignupConfirmation,
    signOut,
    watchAuthState,
    formatAuthError
};
