![image](https://user-images.githubusercontent.com/48162068/60248725-3633f280-98fe-11e9-8099-3e0fc939bf0f.png)

# With-ard
This application can be conversation with another game players.
With-ardは、ゲーマー向けのコミュニケーション用SNSです。
自分の好きなゲームカテゴリやタイトルを登録し、共通の趣味を持ったユーザーと会話することが出来ます。

---

## 機能

- つぶやき投稿機能
- ユーザー検索機能
- ダイレクトメッセージ機能
- ユーザーフォロー機能

---

## 使い方

1. トップページ(https://with-ard.com) にアクセスし,ユーザー情報を登録してください。(4ステップ)
2. ログイン後は全ユーザーの投稿一覧ページにリダイレクトされます。メニューバーから各種機能を利用できます。
3. Post!でつぶやきを投稿して、With-ardユーザーからの注目を集めましょう！
4. Find User!では10種類のゲームカテゴリから、With-ardユーザーを探すことが出来ます。気になるユーザーが見つかったらTalk!してみましょう。
5. ユーザーのプロフィールページから、そのユーザーとのチャット用ページにアクセス出来ます。「一緒にゲームしませんか？」というようなコミュニケーションをとってみてください。
6. With-ardの全てのユーザーをあなたはフォローすることが出来ます。もしお気に入りのユーザーが見つかったら積極的にフォローしてください。

---

## バージョン

- Ruby 2.3.8
- Rails 5.2.3

---

## 使用したGem

```
gem 'rubocop' #コード解析用　現状Warningコードの改善のみ
```
```
gem 'rspec-rails', '~> 3.6' #Rspecでのテスト用
gem 'spring-commands-rspec'
```
```
gem 'devise' #ログイン機能実装用
gem 'wicked' #ステップフォーム実装用
```
```
gem 'cocoon' #ネストフォーム作成用
```
```
gem 'jquery-rails' #jquery
```
```
gem 'bootstrap', '~> 4.1.1' #Bootstrap4
```
```
gem 'kaminari' #ページネーション実装
```
```
gem "refile", require: "refile/rails", github: 'manfe/refile' #画像投稿機能用(今回はカテゴリーテーブルの画像に使用しました。)
gem "refile-mini_magick" #画像サイズ調整用
```
```
gem "aws-sdk-s3", require: false
#ActiveStorage/S3での画像アップロード機能実装用
```
```
gem 'rails_admin', '~> 1.3' #管理者ページ用
```
```
gem 'cancancan', '~> 2.0'
#アクセス制限用(今回はRails_admin用ページへの制限をかけるため)
```

---

## デプロイ

- Webサーバ
> AWS EC2 Apache(Passenger)
- データベース(本番環境用)
> MySQL
- ドメイン取得(DNS設定)
> お名前.com Route53
- 常時SSL化
> ACM(Amazon Certificate Manager)
- 冗長化対策
> ALB(Application Load Balancer) RDS S3(画像投稿用)

---


# 作者

[@neopuri0224](https://twitter.com/neopuri224)
mail to: neopuri0224@gmail.com


