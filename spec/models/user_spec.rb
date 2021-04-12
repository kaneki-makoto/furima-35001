require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録できるとき' do
      it 'nickname、email、password、kanji_last_name、kanji_fist_name、kana_last_name、kan_fist_name、birthayが存在するれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上かつ英数字で混合であれば登録できる' do
        @user.password = '123a56'
        @user.password_confirmation = '123a56'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないこと' do
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '123a5'
        @user.password_confirmation = '123a5'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが英字のみの場合であれば登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが数字のみの場合であれば登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'nicknameが空では登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できなこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

     it '重複したemailが存在する場合は登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
     end

      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = '123a56'
        @user.password_confirmation = '12a456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'kanji_last_nameが空では登録できないこと' do
        @user.kanji_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji last name can't be blank", "Kanji last name is invalid")
      end

      it 'kanji_last_nameが漢字、かな、カナ以外がある場合は登録できないこと' do
        @user.kanji_last_name = 'あ会ア1a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji last name is invalid")
      end

      it 'kanji_fist_nameが空では登録できないこと' do
        @user.kanji_fist_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji fist name can't be blank", "Kanji fist name is invalid")
      end

      it 'kanji_fist_nameが漢字、かな、カナ以外がある場合は登録できないこと' do
        @user.kanji_fist_name = "い胃イi2"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji fist name is invalid")
      end

      it 'kana_last_nameが空では登録できないこと' do
        @user.kana_last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank", "Kana last name is invalid")
      end

      it 'kana_last_nameがカナ以外である場合は登録できないこと' do
        @user.kana_last_name = "アアアあ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name is invalid")
      end

      it 'kana_fist_nameが空では登録できないこと' do
        @user.kana_fist_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana fist name can't be blank", "Kana fist name is invalid")
      end

      it 'kana_fist_nameがカナ以外である場合は登録できないこと' do
        @user.kana_fist_name = "イイイい"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana fist name is invalid")
      end

      it 'birthdayが空では登録できないこと' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end