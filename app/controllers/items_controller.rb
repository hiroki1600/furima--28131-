class ItemsController < ApplicationController
  before_action :move_to_index, expect: [:index]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

 private

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def item_params
    params.require(:item).permit(:name, :text, :category, :status, :shopping_fee_id, :prefecture_id, :scheduled_delivery_id, :peice, :image)
  end

end
