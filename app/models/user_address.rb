class UserAddress < ApplicationRecord
  belongs_to :item, optional: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :Prefecture

  # with_options presence: true do
  #   validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
  #   validates :prefecture_id, numericality: { other_than: 1 }
  #   validates :city
  #   validates :house_number
  #   validates :building_name
  #   validates :phone_number, format: { with: /\A\d{11}\z/ }
  # end


end
