## userテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_ kana|string|null: false|
|family_name_kana|string|null: false|
|birthday|date|null: false|

### Association
- has_many :items, dependent: :destroy​​
- has_many :orders, dependent: :destroy​​



## user​_addressテーブル

|Column|Type|Options|
|------|----|-------|
|postal_code_id|string|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string|-|
|phone_number|string|null: false|
|user_id|integer|null: false, foreign_key: true|


### Association
- belongs_to :item



## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|name|string|null: false|
|description|text|null: false|
|category_id|integer|null: false|
|condition_id|integer|null: false|
|delivery_fee_payers_id|integer|null: false|
|shipping_origin_id|integer|null: false|
|days_until_shipping_id|integer|null: false|
|price|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :user​_address
- has_one :order


## orderテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item