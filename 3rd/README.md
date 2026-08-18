# 3rd フォルダ

## LocalStorage同期

`localStorage.js` が LocalStorage と Supabase の同期本体です。

### 読み込み順

```html
<script src="auth.js"></script>
<script src="../3rd/localStorage.js"></script>
```

ルート直下のHTMLでは:

```html
<script src="2nd/auth.js"></script>
<script src="3rd/localStorage.js"></script>
```

### 同期対象

- `miina_memo`
- `miina_dice_results`
- `miina_dice_history`

Supabase側では `miina_user_storage` テーブルの `data` JSONB に保存します。

Supabase Authが使用する認証トークン等は同期対象に含めません。

`storage.js` は旧コードとの互換用です。新規コードでは `localStorage.js` を使用してください。
