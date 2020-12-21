class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :search_item, only: [:index, :search, :show, :tsearch]

  def index
    @items = Item.all
    set_product_column
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
       @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if current_user.id != @item.user_id 
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id != @item.user_id 
       redirect_to root_path
    else
       @item.destroy
       redirect_to root_path
    end
  end

  def search
    @items = Item.search(params[:keyword])
  end

  def tsearch
    @results = @p.result
  end
  
  private
  
  def search_item
    @p = Item.ransack(params[:q]) 
    set_product_column
  end

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :status_id, :shopping_fee_id, :prefecture_id, :scheduled_delivery_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_product_column 
    @item_category = Category.all
    @item_status = Status.all
    @item_shopping_fee = ShoppingFee.all
  end

end
