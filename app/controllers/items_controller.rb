class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]

  def index
    # @items = Item.order("created_at DESC")
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

  def show
  end

  def edit
  end

  def updete
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :shipping_day_id, :selling_price, :image).merge(user_id: current_user.id)
  end
  

end
