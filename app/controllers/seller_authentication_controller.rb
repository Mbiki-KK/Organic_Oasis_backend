
class SellerAuthenticationController < ApplicationController
  before_action :authenticate_request, except: :login

  def login
    @seller = Seller.find_by_email(params[:email])
    if @seller&.authenticate(params[:password])
      token = JwtHandler.encode(seller_id: @seller.id)
      time = Time.now + 24.hours.to_i
      render json: {
        token: token,
        exp: time.strftime("%m-%d-%Y %H:%M"),
        seller_name: @seller.name
      }, status: :ok
    else
      render json: { error: "unauthorized" }, status: :unauthorized
    end
  end

  private

  # def login_params
  #   params.permit(:email, :password)
  # end
end
