/* memo.js - ユーザー別LocalStorage対応 */
(() => {
    const BASE_STORAGE_KEY = "miina_memo";
    const memo = document.getElementById("memo");
    const status = document.getElementById("memo-status");

    if (!memo) return;

    const setStatus = (text) => {
        if (status) status.textContent = text;
    };

    let storageKey = `${BASE_STORAGE_KEY}_guest`;

    async function prepareStorage() {
        try {
            if (!window.MiinaAuth) {
                console.warn("MiinaAuthが読み込まれていません。ゲスト用LocalStorageを使用します。");
                return;
            }

            const user = await MiinaAuth.getCurrentUser();
            if (user) await MiinaAuth.migrateGuestLocalStorageToUser(user);
            storageKey = MiinaAuth.getScopedStorageKey(BASE_STORAGE_KEY, user?.id || null);
        } catch (error) {
            console.error("ログイン状態の取得に失敗しました:", error);
            storageKey = `${BASE_STORAGE_KEY}_guest`;
        }
    }

    function loadMemo() {
        try {
            memo.value = localStorage.getItem(storageKey) || "";
            setStatus("読み込み完了");
        } catch (error) {
            console.error("LocalStorage read error:", error);
            setStatus("保存データを読み込めませんでした");
        }
    }

    const saveMemo = () => {
        try {
            localStorage.setItem(storageKey, memo.value);
            setStatus("保存しました");
        } catch (error) {
            console.error("LocalStorage write error:", error);
            setStatus("保存できませんでした");
        }
    };

    const clearMemo = () => {
        if (!confirm("メモを削除しますか？")) return;
        memo.value = "";
        try {
            localStorage.removeItem(storageKey);
            setStatus("メモを削除しました");
        } catch (error) {
            console.error("LocalStorage remove error:", error);
            setStatus("メモを削除できませんでした");
        }
    };

    memo.addEventListener("input", () => {
        try {
            localStorage.setItem(storageKey, memo.value);
            setStatus("自動保存中");
        } catch (error) {
            console.error("LocalStorage auto-save error:", error);
        }
    });

    document.getElementById("save-memo")?.addEventListener("click", saveMemo);
    document.getElementById("clear-memo")?.addEventListener("click", clearMemo);

    (async () => {
        await prepareStorage();
        loadMemo();
    })();
})();
