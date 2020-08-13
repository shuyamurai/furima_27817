FactoryBot.define do
  factory :item, class: Item do
    association :user
    name                             { '商品の名前' }
    description                      { '商品の説明' }
    category_id                      { '2' }
    condition_id                     { '2' }
    delivery_fee_payers_id           { '2' }
    shipping_origin_id               { '2' }
    days_until_shipping_id           { '2' }
    price                            { '1000' }
    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('spec', 'factories', 'images', 'test_image.jpg')), filename: 'test_image.jpg', content_type: 'image/jpeg')
    end
  end
  factory :item_noimage, class: Item do
    association :user
    name                             { '商品の名前' }
    description                      { '商品の説明' }
    category_id                      { '2' }
    condition_id                     { '2' }
    delivery_fee_payers_id           { '2' }
    shipping_origin_id               { '2' }
    days_until_shipping_id           { '2' }
    price                            { '1000' }
  end
end