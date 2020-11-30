require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、first_name、last_name、first_name_kana、last_name_kana、生年月日が存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "メールアドレスに＠が含まれている" do
        @user.email = "test@test.jp"
        expect(@user).to be_valid
      end
      it "passwordが6文字以上、且つ英数字混合であれば登録できる" do
        @user.password = "aaaaa1"
        @user.password_confirmation = "aaaaa1"
        expect(@user).to be_valid
      end
      it "first_nameのユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること" do
        @user.first_name = "古川"
        expect(@user).to be_valid
      end
      it "last_nameのユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること" do
        @user.last_name = "浩輝"
        expect(@user).to be_valid
      end
      it "first_name_kanaのユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること" do
        @user.first_name = "フルカワ"
        expect(@user).to be_valid
      end
      it "last_name_kanaのユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること" do
        @user.last_name_kana = "ヒロキ"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "mailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailに＠が含まれていない" do
        @user.email = 'testtest.jp'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "hiro1"
        @user.password_confirmation = "hiro1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid. Input full-width characters.")
      end
      it "first_nameが半角だと登録できない" do
        @user.first_name = 'hiroki'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid. Input full-width characters.")
      end
      it "last_nameが半角だと登録できない" do
        @user.last_name = 'furukawa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
      end
      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank",
        "First name kana is invalid. Input full-width katakana characters.")
      end
      it "first_name_kanaが半角だと登録できない" do
        @user.first_name_kana = 'hiroki'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
      end
      it "last_name_kanaが空だと登録できない" do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank",
          "Last name kana is invalid. Input full-width katakana characters.")
      end
      it "last_name_kanaが半角だと登録できない" do
        @user.last_name_kana = 'furukawa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters.")
      end
      it "passwordが数字のみだと登録できない" do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password passwordには英字と数字の両方を含めて設定してください")
      end
      it "passwordが数字のみだと登録できない" do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password passwordには英字と数字の両方を含めて設定してください")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end