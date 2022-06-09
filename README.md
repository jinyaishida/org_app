## タイトル
GEAR LOG


## 概要
 * サイト概要
 
   山道具とキャンプ道具にフォーカスしたレビュー投稿サイト
   
 * 何ができるか
 
   レビューの投稿、閲覧、検索
   
 * アピールポイント
 
   検索機能を充実させ、自分の買いたいもののレビューを探しやすくしました。
   
   星評価機能を実装し、その商品の評価が一目でわかるようにしました。
   

## URL
http://18.178.63.56/

https://org-app-37645.herokuapp.com/

   

![ec17eab69a9978d04b7a5fb462a7280e](https://user-images.githubusercontent.com/100757861/166178293-3e32b529-8974-4ae9-a4ac-b743d6387afa.jpeg)


![2267487f2340e584d62ee9ce012fa226](https://user-images.githubusercontent.com/100757861/166178448-0f823af1-f3ed-4a2b-b8d4-0282d6fd145d.png)



## 使用技術
Ruby 2.6.5p114

Ruby on Rails 6.0.4.7

MySQL2 (>= 0.4.4)


 
## テーブル設計

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
