class SpicesController < ApplicationController
  before_action :set_spice, only: [:show, :update, :destroy]

  def index
    @spice_products = Spices.all
    render json: @spice_products
  end

  def show
    render json: @spice
  end

  def create
    @spice = Spices.new(spice_params)

    if @spice.save
      render json: @spice, status: :created
    else
      render json: @spice.errors, status: :unprocessable_entity
    end
  end

  def update
    if @spice.update(spice_params)
      render json: @spice
    else
      render json: @spice.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @spice.destroy
    head :no_content
  end

  private

  def set_spice
    @spice = Spices.find(params[:id])
  end

  def spice_params
    params.require(:spice).permit(:name, :price, :image_url, :description)
  end
end
