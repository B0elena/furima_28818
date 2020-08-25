class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :image, :product, :description, :category_id, :condition_id, :shipping_cost_id, :shipping_origin_id, :shipping_day_id, :price, presence: true

  PRICE_REGEX = /\A[0-9]+\z/.freeze
  validates :price, format: {with: PRICE_REGEX}
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :shipping_origin
  belongs_to_active_hash :shipping_day
  validates :category_id, :condition_id, :shipping_cost_id, :shipping_origin_id, :shipping_day_id, numericality: { other_than: 1 }
end
