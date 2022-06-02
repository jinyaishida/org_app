class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 

   validates :nickname, presence: true
   validates :first_name, presence: true
   validates :last_name, presence: true
   validates :first_name_kana, presence: true
   validates :last_name_kana, presence: true
   validates :birthday, presence: true

   VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with:  VALID_PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  validates :first_name,:last_name, format: {with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/,message: 'を全角で入力してください'}
  validates :first_name_kana,:last_name_kana, format: {with: /\A[ァ-ヶー－]+\z/,message: 'を全角カタカナで入力してください'}
  
  has_many :posts
end
