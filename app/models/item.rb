class Item < ApplicationRecord

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :Category
    belongs_to_active_hash :Condition
    belongs_to_active_hash :Deliveryfeepayers
    belongs_to_active_hash :Shippingorigin
    belongs_to_active_hash :Daysuntilshipping

  belongs_to :user

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 } 
  validates :condition_id, presence: true, numericality: { other_than: 1 } 
  validates :delivery_fee_payers_id, presence: true, numericality: { other_than: 1 } 
  validates :shipping_origin_id, presence: true, numericality: { other_than: 1 } 
  validates :days_until_shipping_id, presence: true, numericality: { other_than: 1 } 
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 300, less_than: 1000000}

end
