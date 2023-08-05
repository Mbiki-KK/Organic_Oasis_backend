class VeggiesAndFruitsController < ApplicationController
  before_action :set_veggies_and_fruits, only: [:show, :update, :destroy]

  def index
    @veggies_and_fruits_products = VeggiesAndFruits.all
    render json: @veggies_and_fruits_products
  end

  def show
    render json: @veggies_and_fruits
  end

  def create
    @veggies_and_fruits = VeggiesAndFruits.new(veggies_and_fruits_params)

    if @veggies_and_fruits.save
      render json: @veggies_and_fruits, status: :created
    else
      render json: @veggies_and_fruits.errors, status: :unprocessable_entity
    end
  end

  def update
    if @veggies_and_fruits.update(veggies_and_fruits_params)
      render json: @veggies_and_fruits
    else
      render json: @veggies_and_fruits.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @veggies_and_fruits.destroy
    head :no_content
  end

  private

  def set_veggies_and_fruits
    @veggies_and_fruits = VeggiesAndFruits.find(params[:id])
  end

  def veggies_and_fruits_params
    params.require(:veggies_and_fruits).permit(:name, :price, :image_url, :description)
  end
end
