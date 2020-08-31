class UserBuy
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postcode, :state_id, :city, :street, :building, :phone, :token
  POSTCODE_REGEX = /\A\d{3}-\d{4}\z/.freeze
  PHONE_REGEX = /\A\d{11}\z/.freeze
  with_options presence: true do
    validates :postcode, format: { with: POSTCODE_REGEX }
    validates :phone, format: { with: PHONE_REGEX }
    validates :postcode, :state_id, :city, :street, :phone, :token
  end
  validates :state_id, numericality: { other_than: 1 }
  def save
    buy = Buy.create(item_id: item_id, user_id: user_id)
    Address.create(postcode: postcode, state_id: state_id, city: city, street: street, building: building, phone: phone, buy_id: buy.id)
  end
end
