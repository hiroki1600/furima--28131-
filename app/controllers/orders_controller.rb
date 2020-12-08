class OrdersController < ApplicationController

  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.new
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render root_path
    end
  end


end
