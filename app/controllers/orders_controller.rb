class OrdersController < ApplicationController

  before_action :set_item, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_address)
    if @order_address.valid?
       @order_address.save
       return redirect_to root_path
    else
      render  :index
    end
  end

  private

  def order_address
    params.require(:order_address).permit(:postal_cord, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
