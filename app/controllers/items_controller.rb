class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:image, :product, :description, :category_id, :condition_id, :shipping_cost_id, :shipping_origin_id, :shipping_day_id, :price,)
  end
end
