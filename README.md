## 自炊ログ
自炊ログは、自炊を習慣化するためのWebサービスです。  
自炊記録を可視化したり自炊仲間を作ったりすることで、自炊に対するモチベーションを上げることができます。

![自炊ログ_ゲストログイン機能](https://user-images.githubusercontent.com/103517622/205859242-19104ed5-0655-4ab4-aee1-08481bf9f1ce.gif)

URL : https://jisui-log.herokuapp.com/  
ゲストログインボタンで、メールアドレスとパスワードを入力せずにログインできます。

## ターゲット
自炊をはじめた一人暮らしの大学生です。

## 作成背景
自炊をはじめた一人暮らしの大学生が抱える

**①自身で作った料理を記録として残して簡単に管理したい**  
**②一人暮らしだと自炊をしても誰にもほめてもらえず寂しい、自炊のモチベーションが続かない**

という2つの課題を解決したいと思い、作成に至りました。

## 使い方

### 自炊記録管理の方法
①新規投稿ページから、自炊した料理名・感想・画像を投稿する

![自炊ログ_新規投稿機能](https://user-images.githubusercontent.com/103517622/205858694-8ac50434-d425-46c0-9415-9864d1e65be8.gif)

②自身のプロフィールページに行くとこれまで投稿した自炊記録の一覧を確認することが出来る

![自炊ログ_プロフィールページ](https://user-images.githubusercontent.com/103517622/205841517-69697168-5159-4e71-bdec-52ce45516484.png)

### 自炊のモチベーションを維持する方法
#### (1)フォロー
①投稿一覧ぺージやユーザー一覧ページから気になるユーザーのプロフィールページにいく

②気になるユーザーをフォローして自炊仲間をつくる

![自炊ログ_フォロー機能](https://user-images.githubusercontent.com/103517622/205858549-f37ccdf8-c11e-4789-8c10-9051934c5ece.gif)

#### (2)いいね
①投稿一覧ぺージや気になるユーザーのプロフィールページから気になる投稿の投稿詳細画面にいく

②気になる投稿にいいねをして自炊記録を褒め合う

![自炊ログ_いいね機能](https://user-images.githubusercontent.com/103517622/205858032-ae58891e-2a9b-4153-a0f7-4d7bc0776b75.gif)

#### (3)コメント
①投稿一覧ぺージや気になるユーザーのプロフィールページから気になる投稿の投稿詳細画面にいく

②気になる投稿にコメントをして自炊記録を褒め合う

![自炊ログ_コメント機能](https://user-images.githubusercontent.com/103517622/210377509-15954a53-a5ad-4cd3-a87a-448685800260.gif)

## 使用した技術
#### フロントエンド
 - HTML
 - CSS
 - Bootstrap
 - JavaScript
 - JQuery
 - Font Awesome

#### バックエンド
 - Ruby 2.7.6
 - Ruby on Rails 6.0.4
 - MySQL 14.14

#### インフラ
 - Heroku

#### その他
 - Git/Github

## 使用したgem
 - dotenv-rails(Railsで環境変数を利用するため)
 - devise(認証機能に利用するため)
 - rails-i18n(deviseを日本語化するため)
 - devise-i18n(deviseを日本語化するため)
 - active_storage_validations(ActiveStorageにバリデーションを設定するため)
 - image_processing(ファイルの加工処理のため)
 - mini_magick(ファイルの加工処理のため)
 - aws-sdk-s3(画像投稿機能の実装ため)
 - kaminari(ページネーション機能実装のため)

## ER図
![自炊ログ_ER図](https://user-images.githubusercontent.com/103517622/205428753-bf104f74-2375-470e-9c7a-278c4df5dd98.jpg)

## 機能一覧
 - 画像付き投稿機能(項目：料理の画像、料理タイトル、コメント)
 - いいね機能
 - フォロー機能
 - 新規登録・ログイン機能(Devise)
 - ゲストログイン機能
 - ページネーション機能
 - 投稿に対するコメント機能

## 今後実装したい機能
 - 投稿検索機能(キーワード検索機能)
 - カレンダー機能(投稿数に応じてカレンダーの背景の色が変わる)