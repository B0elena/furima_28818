class Item < ApplicationRecord
  belongs_to :user
  validates :image, :product, :description, :category_id, :condition_id, :shipping_cost_id, :shipping_origin_id, :shipping_day_id, :price, presence: true
end
