# app/controllers/concerns/json_web_token.rb

require 'jwt'
module JsonWebToken
  SECRET_KEY = 'your_secret_key'  # Replace this with your actual secret key

  def self.encode(payload)
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new(decoded)
  end
end

