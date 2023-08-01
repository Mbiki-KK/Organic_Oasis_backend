class AddressController < ApplicationController
  def index
    addresses = Address.all

    render json: addresses
  end

  def show
    address = Address.find_by(id: params[:id])

    render address, include: :users
  end

  def create
    address = Address.new(address_params)
      if address.save
        render json: address, status: :ok
      else
        render json: { errors: "Cannot add address" }, status: :unprocessable_entity
      end
  end

  def destroy
    review = Review.find_by(id: params[:id])

    if review
      review.destroy

      render json: {message: "Deleted successfully"}
    else
      render json: {error: "Review not found"}, status: :not_found
    end
  end

  private

  def address_params
    params.permit(:recipient_name, :city, :street_address)
  end
end
