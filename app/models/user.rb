class User < ApplicationRecord
  after_initialize :set_default_role
  enum role:[:user,:seller,:admin]
  has_secure_password

validates :email, presence:true, uniqueness: true
validates :email, format:{with:URI::MailTo::EMAIL_REGEXP}
validates :username, presence:true, uniqueness: true
validates :password, length:{minimum:6}, if: -> {new_record?||  !password.nil?}



  has_many :orders
  has_many :reviews
  has_many :products, through: :orders


  def set_default_role
self.role ||= :user
  end
end
