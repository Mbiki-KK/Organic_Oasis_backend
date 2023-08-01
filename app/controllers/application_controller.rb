# app/controllers/application_controller.rb

class ApplicationController < ActionController::API
  require 'json_web_token'

  before_action :authenticate_request

  private

  def authenticate_request
    token = request.headers['Authorization']&.split(' ')&.last
    return render json: { error: 'Missing or invalid token' }, status: :unauthorized unless token

    begin
      decoded_token = JsonWebToken.decode(token)
      @current_user_id = decoded_token['user_id']
    rescue JWT::DecodeError => e
      render json: { error: 'Invalid token' }, status: :unauthorized
    end
  end
end

