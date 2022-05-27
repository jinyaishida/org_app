class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'Tシャツ、インナー' },
    { id: 3, name: 'レインウェア' },
    { id: 4, name: 'ダウンウェア' },
    { id: 5, name: 'パンツ' },
    { id: 6, name: 'シューズ・サンダル' },
    { id: 7, name: 'バックパック' },
    { id: 8, name: '寝袋' },
    { id: 9, name: 'テント' },
    { id: 10, name: 'テーブル、イス' },
    { id: 11, name: 'ランタン' },
    { id: 12, name: '調理用品' },
    { id: 13, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :posts 

  end