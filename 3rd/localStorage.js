/*
 * =========================================================
 * Miina Website
 * LocalStorage <-> Supabase 同期
 *
 * ファイル:
 * 3rd/localStorage.js
 *
 * 役割:
 * ・現在の localStorage を取得
 * ・ログインユーザーごとに Supabase へ保存
 * ・Supabase のデータを localStorage へ復元
 *
 * ※ Supabase本体の初期化は 2nd/auth.js が担当
 * =========================================================
 */

(function () {
    "use strict";

    /*
     * ---------------------------------------------------------
     * localStorage 全体をオブジェクト化
     * ---------------------------------------------------------
     */
    function getLocalStorageData() {

        const data = {};

        for (let i = 0; i < localStorage.length; i++) {

            const key = localStorage.key(i);

            if (key === null) {
                continue;
            }

            try {

                data[key] = JSON.parse(
                    localStorage.getItem(key)
                );

            } catch (error) {

                /*
                 * JSONとして読めない通常の文字列は
                 * そのまま保存
                 */
                data[key] = localStorage.getItem(key);
            }
        }

        return data;
    }


    /*
     * ---------------------------------------------------------
     * Supabase → localStorage
     * ---------------------------------------------------------
     */
    async function restoreLocalStorageFromSupabase() {

        if (
            typeof supabaseClient === "undefined" ||
            !supabaseClient
        ) {
            console.error(
                "localStorage同期: Supabaseが初期化されていません。"
            );

            return false;
        }


        /*
         * 現在ログインしているユーザーを取得
         */
        const {
            data: sessionData,
            error: sessionError
        } = await supabaseClient.auth.getSession();


        if (sessionError) {

            console.error(
                "localStorage同期: セッション取得失敗",
                sessionError
            );

            return false;
        }


        const session = sessionData?.session;


        /*
         * ログインしていなければ何もしない
         */
        if (!session) {

            console.log(
                "localStorage同期: 未ログインのため復元しません。"
            );

            return false;
        }


        const userId = session.user.id;


        /*
         * ユーザー自身の保存データを取得
         *
         * RLSにより auth.uid() = user_id のデータだけ
         * 取得可能になっています。
         */
        const {
            data,
            error
        } = await supabaseClient
            .from("miina_user_storage")
            .select("data")
            .eq("user_id", userId)
            .maybeSingle();


        if (error) {

            console.error(
                "localStorage同期: Supabaseからの取得失敗",
                error
            );

            return false;
        }


        /*
         * まだ保存データが存在しない場合
         */
        if (!data) {

            console.log(
                "localStorage同期: 保存データがありません。"
            );

            return true;
        }


        const savedData = data.data;


        if (
            !savedData ||
            typeof savedData !== "object"
        ) {
            return true;
        }


        /*
         * SupabaseのデータをlocalStorageへ復元
         */
        Object.keys(savedData).forEach(function (key) {

            const value = savedData[key];

            if (typeof value === "string") {

                localStorage.setItem(
                    key,
                    value
                );

            } else {

                localStorage.setItem(
                    key,
                    JSON.stringify(value)
                );
            }
        });


        console.log(
            "localStorage同期: Supabase → localStorage 完了"
        );

        return true;
    }


    /*
     * ---------------------------------------------------------
     * localStorage → Supabase
     * ---------------------------------------------------------
     */
    async function saveLocalStorageToSupabase() {

        if (
            typeof supabaseClient === "undefined" ||
            !supabaseClient
        ) {
            console.error(
                "localStorage同期: Supabaseが初期化されていません。"
            );

            return false;
        }


        /*
         * 現在のログイン状態を確認
         */
        const {
            data: sessionData,
            error: sessionError
        } = await supabaseClient.auth.getSession();


        if (sessionError) {

            console.error(
                "localStorage同期: セッション取得失敗",
                sessionError
            );

            return false;
        }


        const session = sessionData?.session;


        /*
         * 未ログインなら保存しない
         */
        if (!session) {

            console.log(
                "localStorage同期: 未ログインのため保存しません。"
            );

            return false;
        }


        const userId = session.user.id;


        /*
         * 現在のlocalStorageを取得
         */
        const localData = getLocalStorageData();


        /*
         * Supabaseへ保存
         *
         * user_id は primary key なので、
         * upsert() によって
         *
         * ・初回 → INSERT
         * ・既存 → UPDATE
         *
         * になります。
         */
        const {
            error
        } = await supabaseClient
            .from("miina_user_storage")
            .upsert(
                {
                    user_id: userId,
                    data: localData,
                    updated_at: new Date().toISOString()
                },
                {
                    onConflict: "user_id"
                }
            );


        if (error) {

            console.error(
                "localStorage同期: Supabaseへの保存失敗",
                error
            );

            return false;
        }


        console.log(
            "localStorage同期: localStorage → Supabase 完了"
        );

        return true;
    }


    /*
     * ---------------------------------------------------------
     * 外部から使用できるように公開
     * ---------------------------------------------------------
     */

    window.MiinaLocalStorageSync = {

        get: getLocalStorageData,

        restore: restoreLocalStorageFromSupabase,

        save: saveLocalStorageToSupabase
    };


    console.log(
        "Miina LocalStorage Sync 読み込み完了"
    );

})();
