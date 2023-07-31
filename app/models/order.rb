class Order < ApplicationRecord
  has_many :products, through: :order_items
  belongs_to :user
  has_many :order_items

  validates :user , presence: true
end
