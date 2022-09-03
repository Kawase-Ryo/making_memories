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
