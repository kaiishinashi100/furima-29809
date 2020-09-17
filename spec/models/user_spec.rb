require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき'
    it 'nickname、email、passwordとconfirmation、family_name_full_widthとfirst_name_full_width、family_name_kanaとfirst_name_kana、birth_dayが存在すれば登録できる' do
      expect(@user).to be_valid
    end
    it 'nicknameが10文字以下であれば登録できる' do
      @user.nickname = 'aaaaaaaaaa'
      expect(@user).to be_valid
    end
    it 'passwordが6文字以上かつ英数字であれば登録できる' do
      @user.password = '000kkk'
      @user.password_confirmation = '000kkk'
      expect(@user).to be_valid
    end
  end

  context '新規登録ができないとき' do
    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'nicknameが11文字以上だと登録できない' do
      @user.nickname = 'aaaaaaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Nickname is too long (maximum is 10 characters)')
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailが重複した場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '000kk'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'family_name_full_widthが存在しないと登録できない' do
      @user.family_name_full_width = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name full width can't be blank")
    end
    it 'first_name_full_widthが存在しないと登録できない' do
      @user.first_name_full_width = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name full width can't be blank")
    end
    it 'family_name_kanaが存在しないと登録できない' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it 'first_name_kanaが存在しないと登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'birth_dayが存在しないと登録できない' do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end
