class OrdersController < ApplicationController
  before_action :set_item 
  before_action :move_to_index, only: [:index]
  before_action :move_to_index_soldout, only: [:index]


  def index
    @buyer = Buyer.new
  end

 
  def create
    @buyer = Buyer.new(user_address_params)
    if @buyer.valid?
      pay_item
      @buyer.save
      return redirect_to root_path
    else
      render 'index'
    end
    # @buyer = UserAddress.new(user_address_params)   
    # @buyer.save
  end

  private

  def move_to_index
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def move_to_index_soldout
    if @item.order.present?
      redirect_to root_path
    end
  end


  def user_address_params
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :token, :item_id ).merge(user_id: current_user.id)
    # params.require(:buyer).permit(prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number:phone_number, item_id:item_id, user_id:user_id)
  end

  def order_params
    params.permit(:price, :token)
  end

  def pay_item
    Payjp.api_key = "PAYJP_SECRET_KEY"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: user_address_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類
    )
  end
  def set_item
    @item = Item.find(params[:item_id])
  end

  # def pay_item
  #   Payjp.api_key = "sk_test_3f543c1e4eed837823927b12"  # PAY.JPテスト秘密鍵
  #   Payjp::Charge.create(
  #     amount: @item.price,  # 商品の値段
  #     card: user_address_params[:token],    # カードトークン
  #     currency:'jpy'                 # 通貨の種類, 
  #     card: params[:card_token] 
  #   )
  #     card = Card.new( # トークン化されたカード情報を保存する
  #       card_token: params[:card_token], # カードトークン
  #       number_token: number.id
  #       cvc_token: cvc.id
  #       exp_month_token: exp_month.id
  #       exp_year_token: exp_year.id
  #     )
  # end
  # def set_item
  #   @item = Item.find(params[:item_id])
  # end
  

end
