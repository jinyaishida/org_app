require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '新規投稿' do
    context '新規投稿ができる時' do
      it 'item_nameとuserとcategoryとetcとpriceが存在すれば登録できる' do
        expect(@post).to be_valid
      end
    end
    context '新規投稿ができない時' do
      it 'item_nameが空では投稿できない' do
        @post.item_name = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("商品名を入力してください")
      end
      it 'priceが空では投稿できない' do
        @post.price = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("価格を入力してください", "価格は数値で入力してください", "価格は不正な値です")
      end
      it 'categoryが未選択項目（idの１）を選択すると投稿できない' do
        @post.category_id = 1
        @post.valid?
        expect(@post.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it 'userが空では投稿できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Userを入力してください")
      end
      it 'etcが空では投稿できない' do
        @post.etc = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'priceが300円以下では投稿できない' do
        @post.price = '299'
        @post.valid?
        expect(@post.errors.full_messages).to include("価格は300以上の値にしてください")
      end
      it "priceが9999999円以上では投稿できない" do
        @post.price = '10000000'
        @post.valid?
        expect(@post.errors.full_messages).to include("価格は9999999以下の値にしてください")
      end
      it "priceに半角数字以外が含まれると投稿できない" do
        @post.price = 'eじ'
        @post.valid?
        expect(@post.errors.full_messages).to include("価格は数値で入力してください")
      end
      it "画像が空では投稿できない" do
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("画像を入力してください")
      end
    end
  end
end
