class ProductsController < ApplicationController
  before_action :authenticate_request, only: [:show, :create, :destroy]
  def index
    @products = Product.all

    render json: @products
  end

  def show
    @product = Product.find_by(id: params[:id])

    render json: @product
  end

  def create
  end

  def destroy
  end
end
