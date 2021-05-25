class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]
  before_action :set_item, only: [:edit, :show]

  def index
    @items = Item.order("created_at DESC")
    # <% ”ダミー表示の為作成。出品一覧表示機能終了後削除”　%>
    # @items = []　
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
  
  def set_item
    @item = Item.find(params[:id])
  end

end
