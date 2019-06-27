![image](https://user-images.githubusercontent.com/48162068/60248725-3633f280-98fe-11e9-8099-3e0fc939bf0f.png)

# With-ard
This application can be coversation with another game players.
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
5. ユーザーのプロフィールページから、そのユーザーとのチャット用ページにアクセス出来ます。「一緒にゲームしませんか？」みたいなコミュニケーションをとってみてください。
6. With-ardの全てのユーザーをあなたはフォローすることが出来ます。もしお気に入りのユーザーが見つかったら積極的にフォローしてください。

---

## インストール

```
$ git clone https://github.com/TomoakiTANAKA/awesome-tool
$ cd awesome-tool
$ sh setup.sh
$ ~do anything~
```

---

## テスト

- Rspecをインストールし、トップメニューの表示のみRspecを学習する意図で導入しました。今後はログインユーザーの単体テストや統合テストにも挑戦したいです。

---

## デプロイ

- Webサーバ
> AWS EC2 Apache(Passenger) MySQL
- ドメイン取得(DNS設定)
> お名前.com Route53
- 常時SSL化
> ACM(Amazon Certificate Manager)
- 冗長化対策
> ALB(Application Load Balancer) RDS S3(画像投稿用)

---

## その他

その他その他その他その他
その他その他その他その他
その他その他その他その他
その他その他その他その他

---

## 作者

[@TanakanoAnchan](https://twitter.com/TanakanoAnchan)
mail to: xxxx@mail.com

---

# ライセンス

[MIT](http://TomoakiTANAKA.mit-license.org)</blockquote>
