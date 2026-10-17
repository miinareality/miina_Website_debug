/* debug-auth.js - debug.html専用 */
document.addEventListener("DOMContentLoaded", async () => {
    const statusElement = document.getElementById("account-status-content");
    if (!statusElement) return;

    const clear = () => statusElement.replaceChildren();

    const addLine = (label, value) => {
        const row = document.createElement("div");
        row.style.marginTop = "8px";
        const strong = document.createElement("strong");
        strong.textContent = label;
        row.appendChild(strong);
        row.appendChild(document.createElement("br"));
        row.appendChild(document.createTextNode(value || "未設定"));
        statusElement.appendChild(row);
    };

    const render = (session) => {
        clear();

        const state = document.createElement("div");
        state.textContent = session?.user ? "🔐 ログイン中" : "🔓 未ログイン";
        statusElement.appendChild(state);

        if (session?.user) {
            addLine("メールアドレス", session.user.email);
            addLine("ユーザーID", session.user.id);
            addLine("認証状態", session.user.email_confirmed_at ? "メール認証済み" : "メール未認証");

            const button = document.createElement("button");
            button.type = "button";
            button.textContent = "ログアウト";
            button.style.marginTop = "12px";
            button.addEventListener("click", async (event) => {
                event.stopPropagation();
                button.disabled = true;
                button.textContent = "ログアウトしています……";
                try {
                    await MiinaAuth.signOut();
                } catch (error) {
                    console.error("Debug logout error:", error);
                    button.disabled = false;
                    button.textContent = "ログアウト";
                    const msg = document.createElement("div");
                    msg.style.marginTop = "8px";
                    msg.style.color = "red";
                    msg.textContent = "ログアウトに失敗しました。";
                    statusElement.appendChild(msg);
                }
            });
            statusElement.appendChild(button);
        } else {
            const msg = document.createElement("div");
            msg.style.marginTop = "8px";
            msg.textContent = "現在ログインしていません。";
            statusElement.appendChild(msg);

            const link = document.createElement("a");
            link.href = "2nd/login.html";
            link.textContent = "ログイン";
            link.style.display = "inline-block";
            link.style.marginTop = "10px";
            statusElement.appendChild(link);
        }
    };

    try {
        await MiinaAuth.initializeSupabase();
        render(await MiinaAuth.getCurrentSession());

        const { data } = await MiinaAuth.watchAuthState((_event, session) => render(session));
        window.addEventListener("pagehide", () => data?.subscription?.unsubscribe?.(), { once: true });
    } catch (error) {
        console.error("Debug authentication status error:", error);
        clear();
        const msg = document.createElement("div");
        msg.textContent = "認証状態を取得できませんでした。";
        statusElement.appendChild(msg);
    }
});
