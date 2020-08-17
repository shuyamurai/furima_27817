FactoryBot.define do
  factory :buyer do
    postal_code                   { '111-1111' }
    prefecture_id                 { '2' }
    city                          { '新宿' }
    house_number                  { '西新宿' }
    building_name                 { '西新宿ビル' }
    phone_number                  { '09011112222' }
    token                         { 'tokenhoge' }
    user
    item
  end
end

