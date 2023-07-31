class Product < ApplicationRecord
  belongs_to :order
  belongs_to :user
  belongs_to :category
end
