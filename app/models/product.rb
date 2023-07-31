class Product < ApplicationRecord
  has_many :reviews
  has_many :orders, through: :order_items
  belongs_to :user
  belongs_to :category
end
