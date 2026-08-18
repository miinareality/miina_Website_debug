/* =========================================================
   3rd/dice-storage.js
   ダイス履歴のLocalStorage + Supabase同期
   ========================================================= */
(() => {
    const DICE_RESULTS_BASE_KEY = "miina_dice_results";
    const DICE_HISTORY_BASE_KEY = "miina_dice_history";

    let DICE_RESULTS_KEY = `${DICE_RESULTS_BASE_KEY}_guest`;
    let DICE_HISTORY_KEY = `${DICE_HISTORY_BASE_KEY}_guest`;
    let diceStorageReady = false;

    async function prepareDiceStorage() {
        try {
            if (!window.MiinaStorage) throw new Error("MiinaStorageが読み込まれていません。");
            const user = await MiinaStorage.getUser();
            if (user) await MiinaStorage.syncAll();
            DICE_RESULTS_KEY = MiinaStorage.getScopedKey(DICE_RESULTS_BASE_KEY, user?.id || null);
            DICE_HISTORY_KEY = MiinaStorage.getScopedKey(DICE_HISTORY_BASE_KEY, user?.id || null);
        } catch (error) {
            console.error("ダイスの保存領域準備に失敗しました:", error);
            DICE_RESULTS_KEY = `${DICE_RESULTS_BASE_KEY}_guest`;
            DICE_HISTORY_KEY = `${DICE_HISTORY_BASE_KEY}_guest`;
        }
        diceStorageReady = true;
    }

    function readLocalArray(key) {
        try {
            const raw = MiinaStorage.read(key);
            if (!raw) return [];
            const data = JSON.parse(raw);
            return Array.isArray(data) ? data : [];
        } catch (error) {
            console.error("LocalStorageの読み込みに失敗しました:", error);
            return [];
        }
    }

    async function writeLocalArray(baseKey, data, maxItems) {
        const limited = data.slice(0, maxItems);
        try {
            await MiinaStorage.save(baseKey, JSON.stringify(limited));
        } catch (error) {
            console.error("LocalStorage/Supabaseへの保存に失敗しました:", error);
        }
    }

    async function removeDiceLocal(baseKey) {
        try {
            await MiinaStorage.removeAndSync(baseKey);
        } catch (error) {
            console.error("履歴削除の同期に失敗しました:", error);
        }
    }

    function getDiceResults() {
        return readLocalArray(DICE_RESULTS_KEY).slice(0, 10);
    }

    async function saveDiceResult(input, total) {
        if (!diceStorageReady) return;
        const results = getDiceResults();
        results.unshift({ expression: input, total });
        await writeLocalArray(DICE_RESULTS_BASE_KEY, results, 10);
        displayDiceResults();
    }

    function displayDiceResults() {
        const container = document.getElementById("diceResultHistory");
        if (!container) return;
        container.innerHTML = "";

        getDiceResults().forEach(item => {
            const button = document.createElement("button");
            button.type = "button";
            button.textContent = `${item.expression} → ${item.total}`;
            button.addEventListener("click", () => {
                document.getElementById("diceInput").value = item.expression;
            });
            container.appendChild(button);
        });
    }

    function getDiceHistory() {
        return readLocalArray(DICE_HISTORY_KEY)
            .filter(item => typeof item === "string")
            .slice(0, 3);
    }

    async function saveDiceHistory(input) {
        if (!diceStorageReady) return;
        let history = getDiceHistory().filter(dice => dice !== input);
        history.unshift(input);
        await writeLocalArray(DICE_HISTORY_BASE_KEY, history, 3);
        loadDiceHistory();
    }

    async function loadDiceHistory() {
        const historyContainer = document.getElementById("diceHistory");
        if (!historyContainer) return;
        historyContainer.innerHTML = "";

        let jsonHistory = [];
        try {
            const response = await fetch("dicelog.json", { cache: "no-store" });
            if (!response.ok) throw new Error("JSONの読み込みに失敗しました");
            const data = await response.json();
            if (Array.isArray(data.history)) {
                jsonHistory = data.history.filter(item => typeof item === "string");
            }
        } catch (error) {
            console.error("dicelog.jsonの読み込みに失敗しました:", error);
        }

        const combinedHistory = [];
        for (const dice of [...jsonHistory, ...getDiceHistory()]) {
            if (!combinedHistory.includes(dice)) combinedHistory.push(dice);
            if (combinedHistory.length >= 6) break;
        }

        combinedHistory.forEach(dice => {
            const button = document.createElement("button");
            button.type = "button";
            button.textContent = dice;
            button.addEventListener("click", () => {
                document.getElementById("diceInput").value = dice;
            });
            historyContainer.appendChild(button);
        });
    }

    async function clearDiceResults() {
        if (!diceStorageReady) return;
        await removeDiceLocal(DICE_RESULTS_BASE_KEY);
        displayDiceResults();
    }

    async function clearDiceHistory() {
        if (!diceStorageReady) return;
        await removeDiceLocal(DICE_HISTORY_BASE_KEY);
        loadDiceHistory();
    }

    window.prepareDiceStorage = prepareDiceStorage;
    window.getDiceResults = getDiceResults;
    window.saveDiceResult = saveDiceResult;
    window.displayDiceResults = displayDiceResults;
    window.getDiceHistory = getDiceHistory;
    window.saveDiceHistory = saveDiceHistory;
    window.loadDiceHistory = loadDiceHistory;
    window.clearDiceResults = clearDiceResults;
    window.clearDiceHistory = clearDiceHistory;

    document.addEventListener("DOMContentLoaded", async () => {
        await prepareDiceStorage();
        displayDiceResults();
        loadDiceHistory();
    });
})();
