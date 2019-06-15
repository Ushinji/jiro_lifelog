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

# テストの実行
* Rspecによるテストが実行できます。
* テストコマンドは以下の２つ
  * 「bundle exec経由の実行」は、起動は遅いですが、起動後のテスト実行が早いのが特徴
  * 「springでpreloadingして実行」は、２回目以降はpreloadingしているので起動が早いのが特徴です
* ただ、`bin/rspec`をする場合は、docker-composeコマンド実行後にspringプロセスが終了してしまうので、preloadingの効果を得ることができません(泣)
  * なので、docker-compose runでコンテナを起動し、それにアタッチした上で実行した方が良いです

```
// bundle exec経由の実行
$ docker-compose run --rm -e RAILS_ENV=test app bundle exec rspec 

// springでpreloadingして実行
$ docker-compose run --rm app bin/rspec spec

// 一度コンテナ起動、アタッチした上でspringを使う場合
$ docker-compose run --rm app bash
root@ab5a56adb191:/app# bin/rspec spec
```

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

# Linter / Formatter
## フロントエンド
- フロントエンドのファイルは、以下のLinter, Formatterを導入している
  - Linter: ESLint
  - Formatter: Pretteir
- 対象のファイルは、`src/~`以下のJavascript, vueのファイル
- これらのファイルがコミットされた場合、ESLintによる修正、コードの品質チェックが自動で行われ、チェックに通った場合コミットすることができる
  - エラーがあった場合は、修正しなければコミットできません
- エディタでVSCodeを使っている場合、以下のESLint, prettierのプラグインを導入すると、ファイル保存時にESLint, Pretteirが実行されるようになり、より開発が加速するので、設定をすることを推奨
  - プラグイン
    - dbaeumer.vscode-eslint
    - esbenp.prettier-vscode
  - 設定(vscodeのsetting.json)
```
{
  "eslint.options": {
    "configFile": ".eslintrc.js"
  },
  "eslint.autoFixOnSave": true,
  "eslint.validate": [
    "javascript",
    { "language": "vue", "autoFix": true },
  ],
```

## バックエンド
- ないです
