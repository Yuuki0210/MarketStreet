class Item < ApplicationRecord

  belongs_to :genre
  has_one_attached :image
  has_many :cart_items
  has_many :customers, through: :cart_items
  has_many :order_items
  has_many :orders, through: :order_items

  validates :price, presence: true
  validates :explanation, presence: true
  validates :name, presence: true
end
