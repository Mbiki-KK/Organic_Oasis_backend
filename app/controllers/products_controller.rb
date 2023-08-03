class ProductsController < ApplicationController
  def index
    @products = Product.all

    render json: @products except: [:created_at, :updated_at]
  end

  def show
    @product = Product.find_by(id: params[:id])

    render json: @product
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
end
