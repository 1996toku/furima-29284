require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'name、email、password、password_confirmation、last_name、first_name、last_name_kana、first_name_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'emailに@を含むと登録できる' do
        @user.email = '000@aaa'
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上、半角英数字の両方があり、passwordとpassward_confimationが同じであれば登録できる' do
        @user.password = '000aaa'
        @user.password_confirmation = '000aaa'
        expect(@user).to be_valid
      end
      it 'ユーザー本名が全角（漢字、ひらがな、カタカナ）であれば登録できる' do
        @user.last_name = '画がガ'
        @user.first_name = '義ぎギ'
      end
      it 'ユーザー本名のフリガナが全角（カタカナ）であれば登録できる' do
        @user.last_name_kana = 'ガガガ'
        @user.first_name_kana = 'ギギギ'
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nameが空だと登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が含まれていないと登録できない' do
        @user.email = 'aaa111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordに半角英数字の両方がなければ登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'passwordとpassword_confirmationが一致しなければ登録できない' do
        @user.password = '000aaa'
        @user.password_confirmation = '000abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'ユーザー本名の名字が空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'ユーザー本名の名前が空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'ユーザー本名の名字に英数字があると登録できない' do
        @user.first_name = '山12s'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name full-width characters.')
      end
      it 'ユーザー本名の名前に英数字があると登録できない' do
        @user.first_name = '山12s'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name full-width characters.')
      end
      it 'ユーザー本名の名字のフリガナが空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'ユーザー本名の名前のフリガナが空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'ユーザー本名の名字のフリガナに漢字、ひらがな、英数字があると登録できない' do
        @user.first_name_kana = '山た2s'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana full-width katakana characters.')
      end
      it 'ユーザー本名の名前のフリガナに漢字、ひらがな、英数字があると登録できない' do
        @user.last_name_kana = '山た2s'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana full-width katakana characters.')
      end
      it '生年月日が空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
