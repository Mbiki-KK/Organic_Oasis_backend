class ProductsController < ApplicationController
  before_action :authenticate_request, only: [:create, :destroy]
  def index
    @products = Product.all

    render json: @products
  end

  def show
    @product = Product.find_by(id: params[:id])

    render json: @product, include: :category
  end

  def create
    product = Product.new(product_params)
      if product.save
        render json: product, status: :ok
      else
        render json: { errors: "Cannot add product" }, status: :unprocessable_entity
      end
  end

  def destroy
    product = Product.find_by(id: params[:id])
      if product
        product.destroy
        head :no_content
      else
        render json: {error: "Product not found"}
      end
  end

  private

  def product_params
    params.permit(:name, :desc, :price, :availability, :image, :category_id, :seller_id)
  end
end
