タイトル
GEAR LOG

概要
・どういうサイトか
　　山道具とキャンプ道具にフォーカスしたレビュー投稿サイト
・何ができるか
　　レビューの投稿、閲覧、検索
・アピールポイント
　　検索機能を充実させ、自分の買いたいもののレビューを探しやすくしました。
 星評価機能を実装し、その商品の評価が一目でわかるようにしました。





タイトルと概要、URL
まずは、タイトル、URLはそのままの意味なので、概要について説明します。
概要は、以下の3点を一言で書いてください。
　・どういうサイトか
　・何ができるのか
　・アピールポイント
 
 
 
 
 
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
- has_many :

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
