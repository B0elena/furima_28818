class UserBuy
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postcode, :state_id, :city, :street, :building, :phone, :token
  validates :postcode, format: {with: /\A\d{3}-\d{4}\z/}
  validates :phone, format: {with: /\A\d{11}\z/}

  def save
    buy = Buy.create(item_id: item_id, user_id: user_id)
    Address.create(postcode: postcode, state_id: state_id , city: city, street: street, building: building, phone: phone, buy_id: buy.id)
  end
end
