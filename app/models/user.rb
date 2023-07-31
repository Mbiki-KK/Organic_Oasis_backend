class User < ApplicationRecord
  after_initialize :set_default_role
  enum role:[:user,:seller,:admin]
  has_one :address
  has_many :orders
  has_many :reviews
  has_many :products, through: :orders
has_secure_password
  def set_default_role
self.role ||= :user
  end
end
