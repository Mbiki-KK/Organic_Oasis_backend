class MeatController < ApplicationController
  before_action :set_meat, only: [:show, :update, :destroy]

  def index
    @meat_products = Meat.all
    render json: @meat_products
  end

  def show
    render json: @meat
  end

  def create
    @meat = Meat.new(meat_params)

    if @meat.save
      render json: @meat, status: :created
    else
      render json: @meat.errors, status: :unprocessable_entity
    end
  end

  def update
    if @meat.update(meat_params)
      render json: @meat
    else
      render json: @meat.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @meat.destroy
    head :no_content
  end

  private

  def set_meat
    @meat = Meat.find(params[:id])
  end

  def meat_params
    params.require(:meat).permit(:name, :price, :image_url, :description)
  end
end
