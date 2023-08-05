class BakeryController < ApplicationController
  before_action :set_bakery, only: [:show, :update, :destroy]

  def index
    @bakery_products = Bakery.all
    render json: @bakery_products
  end

  def show
    render json: @bakery
  end

  def create
    @bakery = Bakery.new(bakery_params)

    if @bakery.save
      render json: @bakery, status: :created
    else
      render json: @bakery.errors, status: :unprocessable_entity
    end
  end

  def update
    if @bakery.update(bakery_params)
      render json: @bakery
    else
      render json: @bakery.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @bakery.destroy
    head :no_content
  end

  private

  def set_bakery
    @bakery = Bakery.find(params[:id])
  end

  def bakery_params
    params.require(:bakery).permit(:name, :price, :image_url, :description)
  end
end
