## userテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|

### Association
- has_one :user_profile, dependent: :destroy​
- has_one :user​_address, dependent: :destroy​
- has_one :user_credit_card, dependent: :destroy​
- has_many :items, dependent: :destroy​​



## user​_profileテーブル

|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_ kana|string|null: false|
|family_name_kana|string|null: false|
|birth_year|date|null: false|
|birth_month|date|null: false|
|birth_day|date|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user



## user​_addressテーブル

|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|-|
|phone_number|integer|null: false|
|user_id|integer|null: false, foreign_key: true|


### Association
- belongs_to :user



## user_credit_cardテーブル

|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false|
|expiration_year|integer|null: false|
|expiration_month|integer|null: false|
|security_code|integer|null: false|
|user_id|integer|null: false, foreign_key: true|


### Association
- belongs_to :user



## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|item_image|text|null: false|
|item_name|string|null: false|
|item_description|text|null: false|
|item_category|string|null: false|
|item_condition|string|null: false|
|delivery_fee_payers|string|null: false|
|shipping_origin|string|null: false|
|days_until_shipping|string|null: false|
|item_price|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user