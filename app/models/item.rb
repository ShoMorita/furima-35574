class Item < ApplicationRecord
  belongs_to :user
  has_one :buyer

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  belongs_to :category
  validates :category_id, numericality: { other_than: 1 } 
  belongs_to :status
  validates :status_id, numericality: { other_than: 1 } 
  belongs_to :delivery_charge
  validates :delivery_charge_id, numericality: { other_than: 1 } 
  belongs_to :prefecture
  validates :prefecture_id, numericality: { other_than: 1 } 
  belongs_to :shipping_day
  validates :shipping_day_id, numericality: { other_than: 1 } 
  validates :selling_price, presence: true

  
end
