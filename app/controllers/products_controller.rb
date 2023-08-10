class ProductsController < ApplicationController
  before_action :authenticate_request, except: [:index, :show]
  def index
    @products = Product.all

    render json: @products, include: :category, except: [:created_at, :updated_at]
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
     render json: { errors: product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    product = Product.find_by(id: params[:id])
      if product
        product.destroy
        head :no_content
      else
        render json: { error: "Product not found"}
      end
  end

  def update
    product = Product.find_by(id: params[:id])
    if product
      if product.update(product_params)
        render json: product, status: :ok
      else
        render_validation_errors(product.errors.full_messages)
      end
    else
      render_error("Product not found")
    end
  end

  private

  def product_params
    params.permit(:name, :desc, :price, :availability, :category_id, :image, :user_id)
  end

end
