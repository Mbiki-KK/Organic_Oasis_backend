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

    render json: address
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
