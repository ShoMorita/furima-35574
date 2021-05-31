class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [ :index, :create ]
  before_action :set_item, only: [ :index, :create ]
  before_action :move_to_id, only: [:index, :create ]

  def index
    @donation_address = DonationAddress.new
  end

  def create
    @donation_address = DonationAddress.new(donation_params)
    if @donation_address.valid?
      pay_item
      @donation_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  

  def donation_params
    params.require(:donation_address).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number ).merge( user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def move_to_id
    redirect_to root_path if  @item.buyer.present?
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item[:selling_price],  # 商品の値段
        card: params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end
