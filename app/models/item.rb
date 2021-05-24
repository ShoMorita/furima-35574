class Item < ApplicationRecord
  belongs_to :user
  # has_one :buyer

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  with_options presence: true do
    validates :image
    validates :name
    validates :description
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :shipping_day_id
  end

  validates :selling_price,
  numericality: { only_integer: true,
  greater_than: 299, less_than: 9999999
  }

  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :shipping_day
  
end
