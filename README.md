# Docker上の開発環境構築

* ローカルPCでdocker, docker-composeが起動できるようにする
  * macの場合は`docker for mac`をインストール
    * [Get started with Docker Desktop for Mac](https://docs.docker.com/docker-for-mac/install/)
  * windowsの場合は、`docker for windows`をインストール
    * [Get started with Docker for Windows](https://docs.docker.com/docker-for-windows/)

* `.env`ファイルをルートディレクトリに作成
  * 環境変数はGoogleAPIのClientIdとSecretの２つ
  * 値は知っている人に聞くこと

```
// .envファイルの内容形式
GOOGLE_CLIENT_ID=~~~
GOOGLE_CLIENT_SECRET=~~~
```

* 開発環境構築スクリプトを実行

```
$ ./scripts/development/bootstrap 

$ docker-compose ps
       Name                     Command               State                 Ports              
-----------------------------------------------------------------------------------------------
jiro_lifelog_app_1   bundle exec rails s -p 300 ...   Up      0.0.0.0:3000->3000/tcp           
jiro_lifelog_db_1    docker-entrypoint.sh mysqld      Up      0.0.0.0:3316->3306/tcp, 33060/tcp
```

* `http://localhost:3000/login` へアクセス

# Dockerなしで開発環境構築

## ビルド
```
bundle install --path vendor/bundle
```

## DB作成・マイグレーション
```
bin/rails db:create
bin/rails db:migrate
```

## サーバ起動
```
bin/rails s
=> localhost:3000
```

## 環境変数の設定
* GOOGLE_CLIENT_ID : クライアントID
* GOOGLE_CLIENT_SECRET : クライアントシークレット

| 環境変数名 | デフォルト | 説明 |
|:-----------|------------:|:------------|
| GOOGLE_CLIENT_ID |  | Googleログインの為のClientID |
| GOOGLE_CLIENT_SECRET |  | Googleログインの為のClientシークレット |