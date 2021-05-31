class Address < ApplicationRecord
  belongs_to :buyer
end

#   validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
#   validates :municipality, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
#   validates :phone_number, presence: true, format: { with: /\A\d{11}\z/ } do

#   with_options presence: true do
#   validates :address
#   validates :building_name
#   end

#   with_options numericality: { other_than: 1 } do
#     validates :prefecture_id
#   end
# end