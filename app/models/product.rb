class Product < ApplicationRecord
  include ImageUploader::Attachment(:image)
  belongs_to :category
  # belongs_to :user
  has_many :order_items
 has_many :reviews,dependent: :destroy
  has_many :orders, through: :order_items

end
