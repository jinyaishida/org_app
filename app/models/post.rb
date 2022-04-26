class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :item_name, presence: true, unless: :was_attached?

  with_options numericality: { other_than: 1, message: "を選択してください"} do
    validates :category_id
    validates :brand_id
  end
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :brand


  def was_attached?
    self.image.attached?
  end

end
