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

window.MiinaAuth = {
    initializeSupabase,
    getCurrentSession,
    signIn,
    signUp,
    resendSignupConfirmation,
    signOut,
    watchAuthState,
    formatAuthError
};
