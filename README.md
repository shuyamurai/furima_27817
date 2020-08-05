## userテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|

### Association
- has_one :user_profile, dependent: :destroy​
- has_one :user_credit_card, dependent: :destroy​
- has_many :items, dependent: :destroy​​



## user​_profileテーブル

|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_ kana|string|null: false|
|family_name_kana|string|null: false|
|birthday|date|null: false|
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
- belongs_to :items



## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|name|string|null: false|
|description|text|null: false|
|category|string|null: false|
|condition|string|null: false|
|delivery_fee_payers|string|null: false|
|shipping_origin|string|null: false|
|days_until_shipping|string|null: false|
|price|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :user​_address



## orderテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|items_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :items