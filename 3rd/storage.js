/*
 * 3rd/storage.js
 *
 * 互換用ファイルです。
 * LocalStorage + Supabase同期の本体は 3rd/localStorage.js に移動しました。
 *
 * 新しいHTMLでは localStorage.js を直接読み込んでください。
 * 既存ページとの互換性のため、このファイル自体は空処理にしています。
 */
(() => {
    if (!window.MiinaStorage) {
        console.warn(
            "storage.js: 先に 3rd/localStorage.js を読み込んでください。"
        );
    }
})();
