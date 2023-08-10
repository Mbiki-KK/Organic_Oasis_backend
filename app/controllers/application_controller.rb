class ApplicationController < ActionController::API
  include JwtHandler

  def authenticate_request
    header = request.headers["Authorization"]
    header = header.split(" ").last if header
    begin
      @decoded = JwtHandler::decode(header)
      pp "decoded #{@decoded}"
      @current_user = AuthorizeApiRequest.call(request.headers).result
    rescue ActiveRecord::RecordNotFound => e
        render json: {errors:e.message}, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: {errors: e.message}, status: :unauthorized
    end
  end

  def current_user
    @current_user
  end

  private

  attr_reader :current_user
end
