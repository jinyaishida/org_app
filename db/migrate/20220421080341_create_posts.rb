class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string     :item_name,        null: false
      t.integer    :brand_id,         null: false
      t.integer    :category_id,      null: false
      t.integer    :purchase_date_id
      t.integer    :price
      t.integer    :weight
      t.text       :etc
      t.text       :good_point
      t.text       :bad_point
      t.float      :cost_rating
      t.float      :function_rating
      t.float      :weight_rating
      t.float      :design_rating
      t.integer    :recommend_rating
      t.references :user,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
