require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
  context 'ユーザー登録ができる時' do
    it 'nicknameとemail、passwordとpassword_confirmationとfirst_nameとlast_nameとfirst_name_kanaとlast_name_kanaとbirthdayが存在すれば登録できる' do
      expect(@user).to be_valid
  end
end
  context 'ユーザー登録ができない時' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end
    it "passwordが129文字以上では登録できない" do
      @user.password = '1a'*129
      @user.password_confirmation = '1a'*129
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは128文字以内で入力してください")
    end
    it "英字のみのパスワードでは登録できない" do
      @user.password = 'eeeeeeee'
      @user.password_confirmation = 'eeeeeeee'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
    end
    it "数字のみのパスワードでは登録できない" do
      @user.password = '00000000'
      @user.password_confirmation = '00000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
    end
    it "全角文字を含むパスワードでは登録できない" do
      @user.password = '000000じ'
      @user.password_confirmation = '000000じ'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名を入力してください", "名を全角で入力してください")
    end   
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("姓を入力してください", "姓を全角で入力してください")
    end   
    it 'first_name_kanaが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名を入力してください", "名を全角で入力してください")
    end    
    it 'last_name_kanaが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("姓を入力してください", "姓を全角で入力してください")
    end    
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("生年月日を入力してください")
    end    
    it 'first_nameが全角（漢字・ひらがな・カタカナ）以外では登録できない' do
      @user.first_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("名を全角で入力してください")
    end
    it 'last_nameが全角（漢字・ひらがな・カタカナ）以外では登録できない' do
      @user.last_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("姓を全角で入力してください")
    end
    it 'first_name_kanaが全角カタカナ以外では登録できない' do
      @user.first_name_kana = 'じじじ'
      @user.valid?
      expect(@user.errors.full_messages).to include("名カタカナを全角カタカナで入力してください")
    end
    it 'last_name_kanaが全角カタカナ以外では登録できない' do
      @user.last_name_kana = 'じじじ'
      @user.valid?
      expect(@user.errors.full_messages).to include("姓カタカナを全角カタカナで入力してください")
    end
  end
end
end

