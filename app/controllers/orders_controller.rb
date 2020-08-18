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
  end

  def order_params
    params.permit(:price, :token)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: user_address_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類
    )
  end
  def set_item
    @item = Item.find(params[:item_id])
  end
end
