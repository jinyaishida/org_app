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
- has_many :purchases

## posts テーブル

| Column             | Type       | Options                         |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| description        | text       | null: false                    |
| price              | integer    | null: false                    |
| rating             | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
| category_id        | integer    | null: false                    |
| model_change       | text       | null: false                    |
| brand_id           | integer    | null: false                    |
| weight             | integer    | null: false                    |
| purchase_date_id   | integer    | null: false                    |


### Association

- belongs_to :user
- has_one :purchase
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :shipping_method
- belongs_to_active_hash :prefectures
- belongs_to_active_hash :shopping_date

## shippings テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| shipping_area_id | integer    | null: false                    |
| city             | string     | null: false                    |
| street           | string     | null: false                    |
| building         | string     |                                |
| phone            | string     | null: false                    |
| purchase         | references | null: false, foreign_key: true |


### Association

- belongs_to :purchase

## purchases テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping
- has_one_active_hash :prefectures