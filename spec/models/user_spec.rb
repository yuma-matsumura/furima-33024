require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
   context '新規登録がうまくいかない場合' do
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
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailには＠を含まない場合は登録できない' do
      @user.email = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordは、５文字以下では登録できない' do
      @user.password = 'a0000'
      @user.password_confirmation = 'a0000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordは、全角英数字混合では登録できない' do
      @user.password = 'A１００００'
      @user.password_confirmation = 'A１００００'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordは、全角英字では登録できない' do
      @user.password = 'AAAAAA'
      @user.password_confirmation = 'AAAAAA'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordは、全角数字では登録できない' do
      @user.password = '１０００００'
      @user.password_confirmation = '１０００００'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordは、半角英語では登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordは、半角数字では登録できない' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordが存在しても、password_confirmationが空では登録できない' do
      @user.password = 'a00000'
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordが存在しても、password_confirmationと一致しなければ登録できない' do
      @user.password = 'a00000'
      @user.password_confirmation = 'a00001'
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
    it 'family_nameは、半角カナでは登録できない' do
      @user.family_name = 'ｶ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name is invalid')
    end
    it 'family_nameは、数字では登録できない' do
      @user.family_name = '1'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name is invalid')
    end
    it 'family_nameは、英語では登録できない' do
      @user.family_name = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name is invalid')
    end
    it 'first_nameは、半角カナでは登録できない' do
      @user.first_name = 'ｶ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end
    it 'first_nameは、数字では登録できない' do
      @user.first_name = '1'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end
    it 'first_nameは、英語では登録できない' do
      @user.first_name = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
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
    it 'family_name_kanaは、半角カナでは登録できない' do
      @user.family_name_kana = 'ｶ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kana is invalid')
    end
    it 'family_name_kanaは、数字では登録できない' do
      @user.family_name_kana = '1'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kana is invalid')
    end
    it 'family_name_kanaは、英語では登録できない' do
      @user.family_name_kana = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kana is invalid')
    end
    it 'family_name_kanaは、ひらがなでは登録できない' do
      @user.family_name_kana = 'あ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kana is invalid')
    end
    it 'first_name_kanaは、半角カナでは登録できない' do
      @user.first_name_kana = 'ｶ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end
    it 'first_name_kanaは、数字では登録できない' do
      @user.first_name_kana = '1'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end
    it 'first_name_kanaは、英語では登録できない' do
      @user.first_name_kana = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end
    it 'first_name_kanaは、ひらがなでは登録できない' do
      @user.first_name_kana = 'あ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
   end
  end
end
