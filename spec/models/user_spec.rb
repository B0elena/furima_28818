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
      end
      it "emailが空では登録できない" do
      end
      it "重複したemailが存在する場合登録できない" do
      end
      it "emailに@がないと登録できない" do
      end
      it "passwordが空では登録できない" do
      end
      it "passwordが5文字以下であれば登録できない" do
      end
      it "passwrordは半角英数字混合でないと登録できない" do
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
      end
      it "名字が空だと登録できない" do
      end
      it "名前が空だと登録できない" do
      end
      it "氏名は全角（漢字・ひらがな・カタカナ）でないと登録できない" do
      end
      it "フリガナの名字が空だと登録できない" do
      end
      it "フリガナの名前が空だと登録できない" do
      end
      it "フリガナは全角（カタカナ）でないと登録できない" do
      end
      it "生年月日が空だと登録できない" do
      end
    end
  end
end
