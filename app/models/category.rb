class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'Tシャツ、インナー' },
    { id: 3, name: 'レインウェア' },
    { id: 4, name: 'ダウンウェア' },
    { id: 5, name: 'シューズ・サンダル' },
    { id: 6, name: 'バックパック' },
    { id: 7, name: 'シュラフ' },
    { id: 8, name: 'テント' },
    { id: 9, name: '調理用品' },
    { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :posts 

  end