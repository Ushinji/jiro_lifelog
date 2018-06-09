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