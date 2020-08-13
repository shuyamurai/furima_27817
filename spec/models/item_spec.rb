require 'rails_helper'

describe Item do



  describe '#create' do

    before do
      @item = FactoryBot.build(:item)
    end

    # 1. 全てのカラムが入力されている時に登録できること
    it 'is valid with a all_column' do
      @item.valid?
      expect(@item).to be_valid
    end

    # 2. imageが空では登録できないこと
    it 'is invalid without a image' do
      @item.image = nil
      @item.valid?
      expect(@item.errors[:image]).to include("can't be blank")
    end

    # 3. nameが空では登録できないこと
    it 'is invalid without a name' do
      @item.name = nil
      @item.valid?
      expect(@item.errors[:name]).to include("can't be blank")
    end

    # 4. descriptionが空では登録できないこと
    it 'is invalid without a description' do
      @item.description = nil
      @item.valid?
      expect(@item.errors[:description]).to include("can't be blank")
    end

    # 5. category_idが空では登録できないこと
    it 'is invalid without a category_id' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors[:category_id]).to include("can't be blank")
    end

    # 6. condition_idが空では登録できないこと
    it 'is invalid without a condition_id' do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors[:condition_id]).to include("can't be blank")
    end

    # 7. delivery_fee_payers_idが空では登録できないこと
    it 'is invalid without a delivery_fee_payers_id' do
      @item.delivery_fee_payers_id = nil
      @item.valid?
      expect(@item.errors[:delivery_fee_payers_id]).to include("can't be blank")
    end

    # 8. shipping_origin_idが空では登録できないこと
    it 'is invalid without a shipping_origin_id' do
      @item.shipping_origin_id = nil
      @item.valid?
      expect(@item.errors[:shipping_origin_id]).to include("can't be blank")
    end

    # 9. days_until_shipping_idが空では登録できないこと
    it 'is invalid without a days_until_shipping_id' do
      @item.days_until_shipping_id = nil
      @item.valid?
      expect(@item.errors[:days_until_shipping_id]).to include("can't be blank")
    end

    # 10. priceが空では登録できないこと
    it 'is invalid without a price' do
      @item.price = nil
      @item.valid?
      expect(@item.errors[:price]).to include("can't be blank")
    end

    # 11. priceが300以下なら登録できないこと
    it 'is invalid cannot register If the price is less than 300, you cannot register' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors[:price]).to include('must be greater than 300')
    end

    # 12. priceが1000000以上なら登録できないこと
    it 'is invalid cannot register If the price is over 1000000, you cannot register' do
      @item.price = '1000000'
      @item.valid?
      expect(@item.errors[:price]).to include('must be less than 1000000')
    end

    # 13. priceが300以上1000000未満なら登録できること
    it 'is You can register If the price is 300 or more and less than 1000000, you can register ' do
      @item.price = '1000'
      expect(@item).to be_valid
    end


    
  end
end

