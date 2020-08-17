class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :Category
  belongs_to_active_hash :Condition
  belongs_to_active_hash :DeliveryFeePayers
  belongs_to_active_hash :ShippingOrigin
  belongs_to_active_hash :DaysUntilShipping

  belongs_to :user
  has_one :order
  has_one :UserAddress

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
    validates :delivery_fee_payers_id, numericality: { other_than: 1 }
    validates :shipping_origin_id, numericality: { other_than: 1 }
    validates :days_until_shipping_id, numericality: { other_than: 1 }
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than: 1_000_000 }        
  end
end
