# Gemfile読み込み
```
bundle install --path vendor/bundle
```

# DB作成・マイグレーション
```
bin/rails db:create
bin/rails db:migrate
```

# サーバ起動
```
bin/rails s
=> localhost:3000
```

# 環境変数の設定
* GOOGLE_CLIENT_ID : クライアントID
* GOOGLE_CLIENT_SECRET : クライアントシークレット

| 環境変数名 | デフォルト | 説明 |
|:-----------|------------:|:------------|
| GOOGLE_CLIENT_ID |  | Googleログインの為のClientID |
| GOOGLE_CLIENT_SECRET |  |Googleログインの為のClientシークレット |
