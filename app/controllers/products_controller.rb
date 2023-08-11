class ProductsController < ApplicationController
  #before_action :authenticate_request, except: :show
  def index
    @products = Product.all
    render json: @products, include: :category
  end
  def show
    @product = Product.find_by(id: params[:id])
    render json: @product
  end
  def create
    product = Product.new(product_params)
    if params[:product][:image] && params[:product][:image][:url]
      image_url = params[:product][:image][:url]
      product.image = URI.parse(image_url)
    end
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
    params.require(:product).permit(:name, :desc, :price, :availability, :category_id, :image, :user_id)
  end
end
