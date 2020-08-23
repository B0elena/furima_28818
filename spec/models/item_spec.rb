require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能' do
    context '商品出品ができる時' do
      it "必須項目が全て存在すれば出品できる" do
        expect(@item).to be_valid
      end
    end
    context '商品出品ができない時' do
      it "出品画像が空だと出品できない" do
      end
      it "商品名が空だと出品できない" do
      end
      it "商品説明が空だと出品できない" do
      end
      it "カテゴリーの情報が空だと出品できない" do
      end
      it "商品の状態の情報が空だと出品できない" do
      end
      it "配送料の負担の情報が空だと出品できない" do
      end
      it "発送元の地域の情報が空だと出品できない" do
      end
      it "発送日までの日数の情報が空だと出品できない" do
      end
      it "価格が空だと出品できない" do
      end
      it "価格が ¥300~¥9,999,999 の間でないと出品できない" do
      end
      it "価格が半角数字でないと出品できない" do
      end
    end
  end
end
