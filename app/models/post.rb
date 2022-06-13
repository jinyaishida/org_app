class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :item_name, presence: true
  validates :price, presence: true
  validates_numericality_of :price, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999
  validates :price, format: { with: /\A[0-9]+\z/ }
  validates :category_id, presence: true
  validates :etc, presence: true
  validates :user, presence: true
  validates :image, presence: true

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
