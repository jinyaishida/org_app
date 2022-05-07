# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| first_name_kana    | string  | null: false               |
| last_name_kana     | string  | null: false               |
| birthday           | date    | null: false               |


### Association

- has_many :posts
- has_many :comments


## posts テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| brand_id           | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| purchase_date_id   | integer    | null: false                    |
| price              | integer    |                                |
| weight             | integer    |                                |
| etc                | text       |                                |
| good_point         | text       |                                |
| bad_point          | text       |                                |
| cost_rating        | float      | null: false                    |
| function_rating    | float      | null: false                    |
| weight_rating      | float      | null: false                    |
| design_rating      | float      | null: false                    |
| recommend_rating   | float      | null: false                    |
| user               | references | null: false, foreign_key: true |



### Association

- belongs_to :user
- belongs_to_active_hash :category



## comments テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| text        | string     | null: false                    |
| user        | references | null: false, foreign_key: true |
| post        | references | null: false, foreign_key: true |


### Association

- belongs_to :user
