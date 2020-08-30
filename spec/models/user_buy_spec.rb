require 'rails_helper'

RSpec.describe UserBuy, type: :model do
  describe '配送先の保存' do
    before do
      @user_buy = FactoryBot.build(:user_buy)
    end

    it'全ての情報が正しく入力されれば購入できる' do
      expect(@user_buy).to be_valid
    end
    it'postcodeが空だと購入できない' do
      @user_buy.postcode = ''
      @user_buy.valid?
      expect(@user_buy.errors.full_messages).to include("Postcode can't be blank")
    end
    it'postcodeはハイフンがないと購入できない' do
      @user_buy.postcode = '1234567'
      @user_buy.valid?
      expect(@user_buy.errors.full_messages).to include("Postcode is invalid")
    end
    it'stateが空だと購入できない' do
      @user_buy.state_id = ''
      @user_buy.valid?
      expect(@user_buy.errors.full_messages).to include("State can't be blank")
    end
    it'cityが空だと購入できない' do
      @user_buy.city = ''
      @user_buy.valid?
      expect(@user_buy.errors.full_messages).to include("City can't be blank")
    end
    it'streetが空だと購入できない' do
      @user_buy.street = ''
      @user_buy.valid?
      expect(@user_buy.errors.full_messages).to include("Street can't be blank")
    end
    it'phoneが空だと購入できない' do
      @user_buy.phone = ''
      @user_buy.valid?
      expect(@user_buy.errors.full_messages).to include("Phone can't be blank")
    end
    it'phoneがハイフンがあると購入できない' do
      @user_buy.phone = '090-1234-5678'
      @user_buy.valid?
      expect(@user_buy.errors.full_messages).to include("Phone is invalid")
    end
    it'phoneが12桁以上だと購入できない' do
      @user_buy.phone = '090123456789'
      @user_buy.valid?
      expect(@user_buy.errors.full_messages).to include("Phone is invalid")
    end
  end
end
