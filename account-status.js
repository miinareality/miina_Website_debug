/* account-status.js - 全HTML共通アカウント状態 */
(() => {
    const root = document.getElementById("account-status");
    const content = document.getElementById("account-status-content");
    const toggle = document.getElementById("account-status-toggle");
    if (!root || !content) return;

    const SUPABASE_URL = "https://xbactiinrfyjdixdlquq.supabase.co";
    const SUPABASE_KEY = "sb_publishable_suDqy2nOQ2nd616qIhR2hg_sX-_2Anc";
    const STORAGE_PREFIX = "sb-xbactiinrfyjdixdlquq-auth-token";

    function setExpanded(expanded) {
        root.classList.toggle("account-status-expanded", expanded);
        root.classList.toggle("account-status-collapsed", !expanded);
        root.setAttribute("aria-expanded", String(expanded));
        root.setAttribute("aria-label", expanded ? "アカウント状態を閉じる" : "アカウント状態を開く");
    }

    function toggleStatus(event) {
        if (event.target.closest("a,button,input,textarea,select")) return;
        setExpanded(!root.classList.contains("account-status-expanded"));
    }

    root.addEventListener("click", toggleStatus);
    root.addEventListener("keydown", (event) => {
        if (event.key === "Enter" || event.key === " ") {
            event.preventDefault();
            toggleStatus(event);
        }
    });

    function clear() { content.replaceChildren(); }
    function line(label, value) {
        const row=document.createElement("div"); row.className="account-status-line";
        const strong=document.createElement("strong"); strong.textContent=label; row.appendChild(strong);
        row.appendChild(document.createElement("br")); row.appendChild(document.createTextNode(value || "未設定"));
        content.appendChild(row);
    }
    function render(user, errorText="") {
        clear();
        const state=document.createElement("div"); state.textContent=user ? "🔐 ログイン中" : "🔓 未ログイン"; content.appendChild(state);
        if (user) {
            line("メールアドレス", user.email);
            line("ユーザーID", user.id);
            line("認証状態", user.email_confirmed_at ? "メール認証済み" : "メール未認証");
        } else {
            const msg=document.createElement("div"); msg.className="account-status-message"; msg.textContent=errorText || "現在ログインしていません。"; content.appendChild(msg);
            const a=document.createElement("a"); a.className="account-status-login-link"; a.href=(location.pathname.includes("/2nd/") ? "login.html" : "2nd/login.html"); a.textContent="ログイン"; content.appendChild(a);
        }
    }
    function findSession() {
        for (let i=0;i<localStorage.length;i++) {
            const key=localStorage.key(i);
            if (!key || key !== STORAGE_PREFIX) continue;
            try {
                const data=JSON.parse(localStorage.getItem(key));
                return data?.currentSession || data || null;
            } catch (_) { return null; }
        }
        return null;
    }
    async function update() {
        try {
            if (window.MiinaAuth) {
                const user = await MiinaAuth.getCurrentUser();
                render(user);
                return;
            }

            const session=findSession();
            if (!session?.access_token) { render(null); return; }
            const res=await fetch(`${SUPABASE_URL}/auth/v1/user`, {headers:{apikey:SUPABASE_KEY, Authorization:`Bearer ${session.access_token}`}, cache:"no-store"});
            if (!res.ok) {
                render(null, res.status===401 ? "ログイン状態の有効期限が切れています。" : "認証状態を取得できませんでした。");
                return;
            }
            render(await res.json());
        } catch (e) {
            console.error("account status",e);
            render(null,"認証状態を取得できませんでした。");
        }
    }
    setExpanded(false);
    update();
    window.addEventListener("storage", e => { if (e.key === STORAGE_PREFIX) update(); });
    document.addEventListener("visibilitychange", () => { if (!document.hidden) update(); });
})();
