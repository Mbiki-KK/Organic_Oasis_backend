# app/controllers/sellers_controller.rb
class SellersController < ApplicationController
  before_action :authenticate_request, except: %i[create index ]
  before_action :find_seller, except: %i[create index]

  # GET /sellers
  def index
    @sellers = Seller.all
    render json: @users, status: :ok, except: [:password_digest, :created_at, :updated_at]
  end

  def show
    @seller = Seller.find(params[:id])


    ender json: @seller
  end
end

def create
  @seller = Seller.new(seller_params)
  if seller.save
    render json: { status: 'Success', message: 'Seller registered successfully' }, status: :created
  else
    render json: { status: 'Error', message: 'Failed to register seller', errors: @seller.errors }, status: :unprocessable_entity
  end
end

private

def seller_params
  params.require(:seller).permit(:name, :email, :password, :password_confirmation)
end
end
