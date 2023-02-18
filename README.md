# NAME: making memories

## Overview
・旅行先や街歩きや散歩等で見かけた、街の気になる風景を投稿、紹介出来るアプリです。

## Description

・このアプリを作るに当たって、CRUDの要素を含むアプリであることを念頭に置きました。

　また、下記のような機能を盛り込みました。

・このアプリにアクセスしたユーザーは、誰でも記事を閲覧することが可能

・ユーザー登録することで、記事の投稿が可能になる

・プロフィールが変更可能になる

・記事投稿の画面（新規スポットの作成）では、スポットの場所を記入すると、その場所のGoogleMapで表示される

・スポットの評価をいいね・コメントをすることが出来る

## Author

・KAWASE RYO

## DEMO

・ユーザーログイン(テスト用アカウントにて)

　　・トップページに入りましたら、右上にある[ログイン]からログインします。

　　・メールアドレスとパスワードを入力しますとログインが可能です。

　　・ログインに成功すると、投稿画面へ移行し、上部に「サインインしました」と表示されます。

https://user-images.githubusercontent.com/108600127/219818619-181ad3a6-4358-4424-a27e-b94069f4393e.mp4

・投稿一覧

　　・ログイン後、右上の投稿一覧ボタンを押すと最新の記事から過去の記事を見ることが可能です。

　　・いいね機能、コメント機能にて、「いいねしました」と表記され、コメントを記入するとコメント一覧に反映されます。

https://user-images.githubusercontent.com/108600127/219819078-fbde367e-3285-4a96-bf44-e6fe7d255dbd.mp4

・プロフィール編集

　　・プロフィールを編集ボタンを押しますと、プロフィール詳細画面へ移行します。

　　・プロフィール画像を選択しますと、プロフィール画像の変更が可能です。

　　（選択されていない場合はデフォルト画像）

　　・自己紹介メッセージの記入も可能です。

https://user-images.githubusercontent.com/108600127/219819414-895bd6d1-6ce7-4c9e-a2bb-66ca9ff1d18f.mp4

・投稿及び詳細画面

　　・投稿画面からファイルを選択ボタンで画像を貼付けが可能です。
  
　　・投稿のタイトルの記入が可能です。
  
　　・投稿説明文の記入が可能です。
  
　　・投稿が成功すると上部に投稿が保存されましたと表示されます。
  
　　・投稿場所の住所を記入しますと、投稿一覧から詳細画面に移行し、GoogleMapに反映されます。
  
https://user-images.githubusercontent.com/108600127/219819679-20420697-9aa5-4f19-9453-8f9f995e266f.mp4

・削除機能

　　・自身が投稿した記事を削除することが可能です。 
  
　　・投稿画像の右上のゴミ箱（アイコン）を押すと記事が削除されます。
  
　　・削除が成功すると、上部に「投稿が削除されました」と表示されます。
  
https://user-images.githubusercontent.com/108600127/219819822-cdadc710-a847-4748-9437-4b055df6fcf0.mp4

・新規登録画面

　　・右上の新規登録ボタンを押すと新規登録画面へ移行します。
  
　　・新規登録にて、メールアドレス・ニックネーム・ユーザーネーム・パスワードを入力しますと新規登録が可能です。
  
https://user-images.githubusercontent.com/108600127/219819980-7b2abadd-2a3f-4b70-8995-ecfb7eb3a0b6.mp4

・ログアウト機能

　　・右上の投稿するボタンを押すと投稿画面へ移行します。
  
　　・右上のログアウトボタンを押すとログアウトされTOPページへ移行します。
 
https://user-images.githubusercontent.com/108600127/219820105-f51299fb-4970-42e2-8b1d-f8ff42e31a2f.mp4

・各種エラー表示

　　・ログイン・投稿・新規登録にて必須項目を入力せずに操作しますとエラー表示が出ます。

https://user-images.githubusercontent.com/108600127/219820216-5b8a7844-0491-445e-aeef-038442de6672.mp4

## ER diagram

・ER図

　　・このアプリで使用されている、テーブルとアソシエーションを示すER図を下記に添付します。

![making_memories](https://user-images.githubusercontent.com/108600127/219820314-430f060d-9538-4135-bc3f-0e0485183944.png)

# README

## users テーブル

| Column             | Type      | Options                       |
| ------------------ | ------    | -----------                   |
| name               | string    | null: false                   |
| email              | string    | null: false, unique: true     |
| encrypted_password | string    | null: false                   |
| profile_photo      | string    | null: false                   |
| username           | string    | null: false                   |
| introduction       | text      | null: false                   |
| created_at         | datetime  | null: false                   |
| updated_at         | datetime  | null: false                   |

### Association

- has_many :likes
- has_many :posts
- has_many :comments

## posts テーブル

| Column             | Type      | Options                      |
| ------------------ | ------    | -----------                  |
| user_id            |           | null: false                  |
| address            | string    |                              |
| caption            | string    |                              |
| image              |           |                              |
| description        | text      |                              |
| created_at         | datetime  | null: false                  |
| updated_at         | datetime  | null: false                  |
| latitude           | float     |                              |
| longitude          | float     |                              |

### Association

- belongs_to :user
- has_many :likes
- has_many :comments

## likes テーブル（いいね機能）

| Column             | Type      | Options                      |
| ------------------ | ------    | -----------                  |
| user_id            |           | null: false                  |
| post_id            |           | null: false                  |
| created_at         | datetime  | null: false                  |
| updated_at         | datetime  | null: false                  |

### Association

- belongs_to :user
- belongs_to :post

## photos テーブル

| Column             | Type      | Options                      |
| ------------------ | ------    | -----------                  |
| name               | string    | null: false                  |
| image              | string    | null: false                  |
| created_at         | datetime  | null: false                  |
| updated_at         | datetime  | null: false                  |

### Association

- belongs_to :post

## comments テーブル（コメント投稿）

| Column             | Type      | Options                      |
| ------------------ | ------    | -----------                  |
| user_id            |           | null: false                  |
| post_id            |           | null: false                  |
| comment            | text      | null: false                  |
| created_at         | datetime  | null: false                  |
| updated_at         | datetime  | null: false                  |

### Association

- belongs_to :user
- belongs_to :post
