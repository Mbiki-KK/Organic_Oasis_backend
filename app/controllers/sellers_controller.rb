# app/controllers/sellers_controller.rb
class SellersController < ApplicationController
  before_action :authenticate_request, except: %i[create index ]
  before_action :find_seller, except: %i[create index]

  # GET /sellers
  def index
    @sellers = Seller.all
    render json: @users, status: :ok, except: [:password_digest, :created_at, :updated_at]
  end
# GET /users/{username}
  def show
    @seller = Seller.find(params[:id])
    render json: @user, status: :ok
  end

 # POST /users
def create
  @seller = Seller.new(seller_params)
  if seller.save
    render json: { status: 'Success', message: 'Seller registered successfully' }, status: :created
  else
    render json: { status: 'Error', message: 'Failed to register seller', errors: @seller.errors }, status: :unprocessable_entity
  end
end
# PUT /sellers/{sellersname}
def update
  unless @seller.update(user_params)
    render json: { errors: @seller.errors.full_messages },
           status: :unprocessable_entity
  end
end
# DELETE
def destroy
  @seller.destroy
end


private

def find_user
  @seller = Seller.find_by_username!(params[:_username])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'Seller not found' }, status: :not_found
end


def seller_params
  params.require(:seller).permit(:name, :email, :password, :password_confirmation)
end
end
