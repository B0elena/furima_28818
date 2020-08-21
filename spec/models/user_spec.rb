require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it "nicknameなど全てが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに@がないと登録できない" do
        @user.email = "testgmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwrordは半角英数字混合でないと登録できない" do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "名字が空だと登録できない" do
        @user.l_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("L name can't be blank")
      end
      it "名前が空だと登録できない" do
        @user.f_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("F name can't be blank")
      end
      it "名字は全角（漢字・ひらがな・カタカナ）でないと登録できない" do
        @user.l_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("L name is invalid")
      end
      it "名前は全角（漢字・ひらがな・カタカナ）でないと登録できない" do
        @user.f_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("F name is invalid")
      end
      it "フリガナの名字が空だと登録できない" do
        @user.l_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("L name kana can't be blank")
      end
      it "フリガナの名前が空だと登録できない" do
        @user.f_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("F name kana can't be blank")
      end
      it "フリガナの名字は全角（カタカナ）でないと登録できない" do
        @user.l_name_kana = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include("L name kana is invalid")
      end
      it "フリガナの名前は全角（カタカナ）でないと登録できない" do
        @user.f_name_kana = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include("F name kana is invalid")
      end
      it "生年月日が空だと登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
