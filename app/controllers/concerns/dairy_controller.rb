class DairyController < ApplicationController
  before_action :set_dairy, only: [:show, :update, :destroy]

  def index
    @dairy_products = Dairy.all
    render json: @dairy_products
  end

  def show
    render json: @dairy
  end

  def create
    @dairy = Dairy.new(dairy_params)

    if @dairy.save
      render json: @dairy, status: :created
    else
      render json: @dairy.errors, status: :unprocessable_entity
    end
  end

  def update
    if @dairy.update(dairy_params)
      render json: @dairy
    else
      render json: @dairy.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @dairy.destroy
    head :no_content
  end

  private

  def set_dairy
    @dairy = Dairy.find(params[:id])
  end

  def dairy_params
    params.require(:dairy).permit(:name, :price, :image_url, :description)
  end
end
