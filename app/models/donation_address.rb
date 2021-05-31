class DonationAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id,:buyer_id, :postal_code, :prefecture_id,:municipality, :address, :building_name, :phone_number, :token

  validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :municipality, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :phone_number, presence: true, format: { with: /\A\d{11}\z/ } 

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :address
    validates :token
  end

  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
  end

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Address.create(buyer_id: buyer_id, postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number)
  end
end

