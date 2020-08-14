class ItemsController < ApplicationController
  def index
    @items = Item.all.order('created_at DESC')
    # @items = Item.all
  end

  def new
    @item = Item.new
    redirect_to new_user_session_path unless user_signed_in?
  end

  def create
    @item = Item.new(item_params)
    # Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  # def create
  #   item = Item.new(item_params)
  #   # Item.create(item_params)
  #   if item.save!
  #     redirect_to root_path
  #   end
  # end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :delivery_fee_payers_id, :shipping_origin_id, :days_until_shipping_id, :price).merge(user_id: current_user.id)
  end
end
