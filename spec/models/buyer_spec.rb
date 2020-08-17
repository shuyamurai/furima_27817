require 'rails_helper'

describe Buyer do
  describe '#build' do
    before do
      #出品者をファクトリーで生成
      seller = FactoryBot.build(:user)
      #購入者をファクトリーで生成

      buyer = FactoryBot.build(:user)
      # buyer = FactoryBot:user
      #商品を出品（出品者seller.id）
      item = FactoryBot.build(:item, user_id: seller.id)
      # item = FactoryBot:item(user_id: seller.id)
      #出品されている商品を購入（購入者)
      #住所のファクトリーを生成
      @buyer = FactoryBot.build(:buyer, item_id: item.id, user_id: buyer.id)
    end

    # 1. 全てのカラムが入力されている時に登録できること
    it 'is valid with a all_column' do
      @buyer.valid?
      expect(@buyer).to be_valid
    end

    # 2. postal_codeが空では登録できないこと
    it 'is invalid without a postal_code' do
      @buyer.postal_code = nil
      @buyer.valid?
      expect(@buyer.errors[:postal_code]).to include("can't be blank")
    end

    # 3. postal_codeが『○○○-○○○○』の形以外だと登録できないこと
    it 'is invalid cannot register if the postal_code is not in the form of "○○○-○○○○' do
      @buyer.postal_code = '1234567'
      @buyer.valid?
      expect(@buyer.errors[:postal_code]).to include('is invalid')
    end    

    # 4. postal_codeが『○○○-○○○○』の形で登録できること（ハイフンの使用）
    it 'is valid You can register if the postal_code is not in the form of "○○○-○○○○" ' do
      @buyer.postal_code = '123-4567'
      expect(@buyer).to be_valid
    end

    # 5. prefecture_idが空では登録できないこと
    it 'is invalid without a prefecture_id' do
      @buyer.prefecture_id = nil
      @buyer.valid?
      expect(@buyer.errors[:prefecture_id]).to include("can't be blank")
    end

    # 6. prefecture_idが「--」では登録できないこと
    it 'is invalid if citizen_id is "-"' do
      @buyer.prefecture_id = 'id1'
      @buyer.valid?
      expect(@buyer.errors[:prefecture_id]).to include("is not a number")
    end

    # 7. cityが空では登録できないこと
    it 'is invalid without a city' do
      @buyer.city = nil
      @buyer.valid?
      expect(@buyer.errors[:city]).to include("can't be blank")
    end

    # 8. house_numberが空では登録できないこと
    it 'is invalid without a house_number' do
      @buyer.house_number = nil
      @buyer.valid?
      expect(@buyer.errors[:house_number]).to include("can't be blank")
    end

    # 9. phone_numberが空では登録できないこと
    it 'is invalid without a house_number' do
      @buyer.phone_number = nil
      @buyer.valid?
      expect(@buyer.errors[:phone_number]).to include("can't be blank")
    end

    # 10. phone_numberに「-」が使われていると登録できないこと
    it 'is invalid cannot register if "-" is used for phone_number' do
      @buyer.phone_number = '080-1111-2222'
      @buyer.valid?
      expect(@buyer.errors[:phone_number]).to include('is invalid')
    end    

    # 11. phone_numberが12桁以上で登録できないこと
    it 'is invalid phone_number with more than 12 digits' do
      @buyer.phone_number = 123456789123
      @buyer.valid?
      expect(@buyer.errors[:phone_number]).to include("is invalid")
    end

    # 12. phone_numberがハイフンを使わずに11桁以内で登録できること
    it 'is valid Phone_number can be registered within 11 digits without hyphens ' do
      @buyer.phone_number = '123'
      expect(@buyer).to be_valid
    end

    # 13. tokenが空では登録できないこと
    it 'is invalid without a token' do
      @buyer.token = nil
      @buyer.valid?
      expect(@buyer.errors[:token]).to include("can't be blank")
    end
  end
end
