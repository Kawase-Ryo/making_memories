# README

## users テーブル

| Column             | Type      | Options                       |
| ------------------ | ------    | -----------                   |
| nickname           | string    | null: false                   |
| email              | string    | null: false, unique: true     |
| encrypted_password | string    | null: false                   |
| created_at         | datetime  | null: false                   |
| updated_at         | datetime  | null: false                   |

### Association

- has_many :likes
- has_many :posts
- has_many :comments

## posts テーブル（軸）

| Column             | Type      | Options                      |
| ------------------ | ------    | -----------                  |
| user               | references| null: false,foreign_key: true|
| content            | text      | null: false                  |
| image              |           |                              |
| created_at         | datetime  | null: false                  |
| prefecture_id      | integer   | null: false                  |
| city_id            | string    | null: false                  |

### Association

- belongs_to :user
- has_many :likes
- has_many :comments
- has_many :prefectures

## likes テーブル（いいね機能）

| Column             | Type      | Options                      |
| ------------------ | ------    | -----------                  |
| user               | references| null: false,foreign_key: true|
| post               | references| null: false,foreign_key: true|
| created_at         | datetime  | null: false                  |
| updated_at         | datetime  | null: false                  |

### Association

- belongs_to :user
- belongs_to :post

## prefectures テーブル（都道府県）

| Column             | Type      | Options                      |
| ------------------ | ------    | -----------                  |
| name               | string    | null: false                  |
| prefecture_id      | integer   | null: false                  |

### Association

- belongs_to :post

## comments テーブル（コメント投稿）

| Column             | Type      | Options                      |
| ------------------ | ------    | -----------                  |
| user               | references| null: false,foreign_key: true|
| post               | references| null: false,foreign_key: true|
| content            | text      | null: false                  |
| created_at         | datetime  | null: false                  |
| updated_at         | datetime  | null: false                  |

### Association

- belongs_to :user
- belongs_to :post
