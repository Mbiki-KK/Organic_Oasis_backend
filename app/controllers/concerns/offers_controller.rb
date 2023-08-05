class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :update, :destroy]

  def index
    @offer_products = Offers.all
    render json: @offer_products
  end

  def show
    render json: @offer
  end

  def create
    @offer = Offers.new(offer_params)

    if @offer.save
      render json: @offer, status: :created
    else
      render json: @offer.errors, status: :unprocessable_entity
    end
  end

  def update
    if @offer.update(offer_params)
      render json: @offer
    else
      render json: @offer.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @offer.destroy
    head :no_content
  end

  private

  def set_offer
    @offer = Offers.find(params[:id])
  end

  def offer_params
    params.require(:offer).permit(:name, :price, :image_url, :description)
  end
end
