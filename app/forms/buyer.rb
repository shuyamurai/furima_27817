class Buyer

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id, :user_id, :token
  REGEX = /\A[0-9]{3}-[0-9]{4}\z/
  REGEX2 = /\A\d{1,11}\z/
  with_options presence: true do
    validates :postal_code, format: { with: REGEX }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :house_number
    # validates :building_name
    validates :phone_number, format: { with: REGEX2 }
    validates :token
  end
  def save
 
    UserAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number)
    Order.create(item_id: item_id, user_id: user_id)
  end
end