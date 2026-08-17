/* login.js - login.html専用 */
document.addEventListener("DOMContentLoaded", () => {
    const email = document.getElementById("email");
    const password = document.getElementById("password");
    const loginButton = document.getElementById("loginButton");
    const signupButton = document.getElementById("signupButton");
    const message = document.getElementById("authMessage");
    const resendButton = document.getElementById("resendConfirmationButton");

    if (!email || !password || !loginButton || !signupButton || !message) {
        console.error("login.htmlの認証UIを取得できませんでした。");
        return;
    }

    let lastSignupEmail = "";

    const show = (text, error = false) => {
        message.textContent = text;
        message.style.color = error ? "red" : "";
    };

    const setBusy = (busy) => {
        loginButton.disabled = busy;
        signupButton.disabled = busy;
    };

    loginButton.addEventListener("click", async () => {
        const emailValue = email.value.trim();
        const passwordValue = password.value;

        if (!emailValue || !passwordValue) {
            show("メールアドレスとパスワードを入力してください。", true);
            return;
        }

        setBusy(true);
        show("ログインしています……");

        try {
            await MiinaAuth.signIn(emailValue, passwordValue);
            show("ログインしました。debug.htmlへ移動します。");
            setTimeout(() => {
                window.location.href = "../debug.html";
            }, 300);
        } catch (error) {
            console.error("Login error:", error);
            show(MiinaAuth.formatAuthError(error), true);
            if (/email not confirmed/i.test(String(error?.message || ""))) {
                lastSignupEmail = emailValue;
                if (resendButton) resendButton.hidden = false;
            }
        } finally {
            setBusy(false);
        }
    });

    signupButton.addEventListener("click", async () => {
        const emailValue = email.value.trim();
        const passwordValue = password.value;

        if (!emailValue || !passwordValue) {
            show("メールアドレスとパスワードを入力してください。", true);
            return;
        }
        if (passwordValue.length < 6) {
            show("パスワードは6文字以上にしてください。", true);
            return;
        }

        setBusy(true);
        show("アカウントを作成しています……");

        try {
            const data = await MiinaAuth.signUp(emailValue, passwordValue);
            lastSignupEmail = emailValue;
            if (resendButton) resendButton.hidden = false;

            if (!data.session) {
                show("アカウントを作成しました。確認メールを送信しました。メール内のリンクを押して認証を完了してください。");
            } else {
                show("アカウントを作成しました。ログインできます。");
            }
        } catch (error) {
            console.error("Signup error:", error);
            show(MiinaAuth.formatAuthError(error), true);
        } finally {
            setBusy(false);
        }
    });

    resendButton?.addEventListener("click", async () => {
        const emailValue = lastSignupEmail || email.value.trim();
        if (!emailValue) {
            show("確認メールを再送するメールアドレスを入力してください。", true);
            return;
        }

        resendButton.disabled = true;
        show("確認メールを再送しています……");

        try {
            await MiinaAuth.resendSignupConfirmation(emailValue);
            show("確認メールを再送しました。メールをご確認ください。");
        } catch (error) {
            console.error("Resend error:", error);
            show(MiinaAuth.formatAuthError(error), true);
        } finally {
            resendButton.disabled = false;
        }
    });

    // 確認メールから戻ってきた場合の表示。
    MiinaAuth.getCurrentSession()
        .then((session) => {
            if (session?.user?.email_confirmed_at) {
                show("メールアドレスの認証が完了しました。ログインできます。");
            }
        })
        .catch((error) => console.error("Session check error:", error));
});
