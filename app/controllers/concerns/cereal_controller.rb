class CerealController < ApplicationController
  before_action :set_cereal, only: [:show, :update, :destroy]

  def index
    @cereal_products = Cereal.all
    render json: @cereal_products
  end

  def show
    render json: @cereal
  end

  def create
    @cereal = Cereal.new(cereal_params)

    if @cereal.save
      render json: @cereal, status: :created
    else
      render json: @cereal.errors, status: :unprocessable_entity
    end
  end

  def update
    if @cereal.update(cereal_params)
      render json: @cereal
    else
      render json: @cereal.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @cereal.destroy
    head :no_content
  end

  private

  def set_cereal
    @cereal = Cereal.find(params[:id])
  end

  def cereal_params
    params.require(:cereal).permit(:name, :price, :image_url, :description)
  end
end
