require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'ユーザー情報が全て正しく入力されれば登録できる' do
        expect(@user).to be_valid
      end
    end


    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")    
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank") 
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password") 
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank") 
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank") 
      end
      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank") 
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank") 
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank") 
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it '@を含まないメールアドレスは登録できない' do
        @user.email = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが半角英字のみでは登録できない' do
        @user.password = "abcdef"
        @user.password_confirmation = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordとpassword_confirmationが一致しなければ登録できない' do
        @user.password = "aaa2aa"
        @user.password_confirmation = "bbb2bb"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '英数字が含まれるfamily_nameは登録できない' do
        @user.family_name = "a2"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      it '英数字が含まれるfirst_nameは登録できない' do
        @user.first_name = "a2"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it '英数字が含まれるfamily_name_kanaは登録できない' do
        @user.family_name_kana = "a2"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end
      it '英数字が含まれるfirst_name_kanaは登録できない' do
        @user.first_name_kana = "a2"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it '半角（カタカナ）が含まれるfamily_nameは登録できない' do
        @user.family_name = "ｱｱ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      it '半角（カタカナ）が含まれるfirst_nameは登録できない' do
        @user.first_name = "ｱｱ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it '半角（カタカナ）が含まれるfamily_name_kanaは登録できない' do
        @user.family_name_kana = "ｱｱ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end
      it '半角（カタカナ）が含まれるfirst_name_kanaは登録できない' do
        @user.first_name_kana = "ｱｱ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it '全角（漢字）が含まれるfamily_name_kanaは登録できない' do
        @user.family_name_kana = "山田"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end
      it '半角（漢字）が含まれるfirst_name_kanaは登録できない' do
        @user.first_name_kana = "山田"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it '全角（ひらがな）が含まれるfamily_name_kanaは登録できない' do
        @user.family_name_kana = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end
      it '半角（ひらがな）が含まれるfirst_name_kanaは登録できない' do
        @user.first_name_kana = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

    end
  end
end
