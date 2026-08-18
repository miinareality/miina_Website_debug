/* memo.js - 3rd/LocalStorage + Supabase同期 */
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
            if (!window.MiinaStorage) throw new Error("MiinaStorageが読み込まれていません。");
            const user = await MiinaStorage.getUser();
            if (user) await MiinaStorage.syncAll();
            storageKey = MiinaStorage.getScopedKey(BASE_STORAGE_KEY, user?.id || null);
        } catch (error) {
            console.error("メモの保存領域準備に失敗しました:", error);
            storageKey = `${BASE_STORAGE_KEY}_guest`;
        }
    }

    function loadMemo() {
        try {
            memo.value = MiinaStorage.read(storageKey) || "";
            setStatus("読み込み完了");
        } catch (error) {
            console.error("LocalStorage read error:", error);
            setStatus("保存データを読み込めませんでした");
        }
    }

    const saveMemo = async () => {
        try {
            await MiinaStorage.save(BASE_STORAGE_KEY, memo.value);
            setStatus("保存しました");
        } catch (error) {
            console.error("Memo save error:", error);
            setStatus("保存できませんでした");
        }
    };

    const clearMemo = async () => {
        if (!confirm("メモを削除しますか？")) return;
        memo.value = "";
        try {
            await MiinaStorage.removeAndSync(BASE_STORAGE_KEY);
            setStatus("メモを削除しました");
        } catch (error) {
            console.error("Memo remove error:", error);
            setStatus("メモを削除できませんでした");
        }
    };

    let autoSaveTimer = null;
    memo.addEventListener("input", () => {
        setStatus("自動保存中");
        clearTimeout(autoSaveTimer);
        autoSaveTimer = setTimeout(async () => {
            try {
                await MiinaStorage.save(BASE_STORAGE_KEY, memo.value);
                setStatus("自動保存しました");
            } catch (error) {
                console.error("Memo auto-save error:", error);
                setStatus("自動保存できませんでした");
            }
        }, 500);
    });

    document.getElementById("save-memo")?.addEventListener("click", saveMemo);
    document.getElementById("clear-memo")?.addEventListener("click", clearMemo);

    (async () => {
        await prepareStorage();
        loadMemo();
    })();
})();
