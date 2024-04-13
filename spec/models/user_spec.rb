require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '必要な情報がすべて存在すれば登録できる' do
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

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save!
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
      it 'lastname_kanjiが空では登録できない' do
        @user.lastname_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kanji can't be blank")
      end

      it 'firstname_kanjiが空では登録できない' do
        @user.firstname_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kanji can't be blank")
      end

      it 'lastname_kanaがカタカナでないと登録できない' do
        @user.lastname_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Lastname kana はカタカナで入力してください')
      end

      it 'firstname_kanaがカタカナでないと登録できない' do
        @user.firstname_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname kana はカタカナで入力してください')
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it '英字のみのパスワードでは登録できない' do
        user = build(:user, password: 'abcdefghij', password_confirmation: 'abcdefghij')
        user.valid?
        expect(user).not_to be_valid
        expect(user.errors[:password]).to include('は半角英数混合で入力してください')
      end

      it '数字のみのパスワードでは登録できない' do
        user = build(:user, password: '1234567890')
        expect(user).not_to be_valid
        expect(user.errors[:password]).to include('は半角英数混合で入力してください')
      end

      it '全角文字を含むパスワードでは登録できない' do
        user = build(:user, password: 'abc123あいう')
        expect(user).not_to be_valid
        expect(user.errors[:password]).to include('は半角英数混合で入力してください')
      end

      it '姓（全角）に半角文字が含まれていると登録できない' do
        user = build(:user, lastname_kana: '山田taro')
        expect(user).not_to be_valid
        expect(user.errors[:lastname_kana]).to include('はカタカナで入力してください')
      end

      it '名（全角）に半角文字が含まれていると登録できない' do
        user = build(:user, firstname_kana: '太郎hanako')
        expect(user).not_to be_valid
        expect(user.errors[:firstname_kana]).to include('はカタカナで入力してください')
      end
      it 'lastname_kanjiが全角日本語でないと登録できない' do
        user = build(:user, lastname_kanji: 'Yamada123')
        user.valid?
        expect(user.errors[:lastname_kanji]).to include('は全角文字で入力してください')
      end

      it 'firstname_kanjiが全角日本語でないと登録できない' do
        user = build(:user, firstname_kanji: 'Taro123')
        user.valid?
        expect(user.errors[:firstname_kanji]).to include('は全角文字で入力してください')
      end
    end
  end
end
