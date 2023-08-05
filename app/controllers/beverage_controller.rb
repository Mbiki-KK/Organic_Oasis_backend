class BeverageController < ApplicationController
  before_action :set_beverage, only: [:show, :update, :destroy]

  def index
    @beverage_products = Beverage.all
    render json: @beverage_products
  end

  def show
    render json: @beverage
  end

  def create
    @beverage = Beverage.new(beverage_params)

    if @beverage.save
      render json: @beverage, status: :created
    else
      render json: @beverage.errors, status: :unprocessable_entity
    end
  end

  def update
    if @beverage.update(beverage_params)
      render json: @beverage
    else
      render json: @beverage.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @beverage.destroy
    head :no_content
  end

  private

  def set_beverage
    @beverage = Beverage.find(params[:id])
  end

  def beverage_params
    params.require(:beverage).permit(:name, :price, :image_url, :description)
  end
end
