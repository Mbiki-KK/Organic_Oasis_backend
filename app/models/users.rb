class User < ApplicationRecord
  has_one :address
  has_many :orders
  has_many :reviews
  has_many :products, through: :orders
end
