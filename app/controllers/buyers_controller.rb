class BuyersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @donation_address = DonationAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @donation_address = DonationAddress.new(donation_params)
    if @donation_address.valid?
      Payjp.api_key = "sk_test_b68f960cbb71a7f899a8cde8"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item[:selling_price],  # 商品の値段
        card: params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @donation_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  

  def donation_params
    params.require(:donation_address).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number ).merge( user_id: current_user.id, item_id: params[:item_id])
  end

  # def item_params
  #   params.require(:item).permit(:name, :description, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :shipping_day_id, :selling_price, :image).merge(user_id: current_user.id)
  # end

  # def buyer_params
  #   params.require(:buyer).merge(user_id: current_user.id, item_id:current_item.id)
  # end

  # def address_params
  #   params.require(:address).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number ).merge(buyer_id: @buyer.id)
  # end

end
