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
|postal_code|string|null: false|
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




"item"=>{
    "image"=>#<ActionDispatch::Http::UploadedFile:0x00007feef8bd27e0 @tempfile=#<Tempfile:/var/folders/hs/ylqm_jpx1610q83kzblt1vv40000gn/T/RackMultipart20200815-9897-1gzpvp5.jpg>, @original_filename="test_image.jpg", @content_type="image/jpeg", @headers="Content-Disposition: form-data; name=\"item[image]\"; filename=\"test_image.jpg\"\r\nContent-Type: image/jpeg\r\n">,
    "name"=>"dag",
    "description"=>"gagds",
    "category_id"=>"3",
    "condition_id"=>"3",
    "delivery_fee_payers_id"=>"2",
    "shipping_origin_id"=>"2",
    "days_until_shipping_id"=>"3",
    "price"=>"11111"
  }

params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :delivery_fee_payers_id, :shipping_origin_id, :days_until_shipping_id, :price).merge(user_id: current_user.id)



  "postal_code"=>"123-9999",
  "prefecture_id"=>"3",
  "city"=>"東京都2",
  "house_number"=>"新宿2",
  "building_name"=>"新宿ビル2",
  "phone_number"=>"09099998888"


params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number)

・ストロングパラメーターの記述
requireをどうするのか
mergeをつかって必要な情報をいれる

・attr_accessorの記述も変更しないといけない
Order.createで保存する情報をとるため