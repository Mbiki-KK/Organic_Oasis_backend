class SellersController < ApplicationController
  before_action :authenticate_request, except: %i[create index]
  before_action :find_seller, except: %i[create index]

  # GET /sellers
  def index
    @sellers = Seller.all
    render json: @sellers, status: :ok, except: [:password_digest, :created_at, :updated_at]
  end

  # GET /sellers/{username}
  def show
    @seller = Seller.find(params[:id])
    render json: @seller, status: :ok
  end

  # POST /sellers
  def create
    @seller = Seller.new(seller_params)
    if @seller.save
      render json: { status: 'Success', message: 'Seller registered successfully' }, status: :created
    else
      render json: { status: 'Error', message: 'Failed to register seller', errors: @seller.errors }, status: :unprocessable_entity
    end
  end

  # PUT /sellers/{seller_id}
  def update
    if @seller.update(seller_params)
      render json: { status: 'Success', message: 'Seller updated successfully' }, status: :ok
    else
      render json: { status: 'Error', message: 'Failed to update seller', errors: @seller.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /sellers/{seller_id}
  def destroy
    @seller.destroy
    render json: { status: 'Success', message: 'Seller deleted successfully' }, status: :ok
  end

  private

  def find_seller
    @seller = Seller.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'Seller not found' }, status: :not_found
  end

  def seller_params
    params.require(:seller).permit(:name, :email, :username, :password, :password_confirmation)
  end
end
