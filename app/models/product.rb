class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :category
  belongs_to :user, foreign_key: :user_id
  has_many :order_items
 has_many :reviews,dependent: :destroy
  has_many :orders, through: :order_items
end
