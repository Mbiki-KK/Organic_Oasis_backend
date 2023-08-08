# app/controllers/sellers_controller.rb
class SellersController < ApplicationController
  before_action :authenticate_seller!, except: [:index, :show]

  def index
    @sellers = Seller.all
  end

  def show
    @seller = Seller.find(params[:id])
  end
end

# app/controllers/products_controller.rb
class ProductsController < ApplicationController
  before_action :authenticate_seller!

  def new
    @seller = current_seller
    @product = @seller.products.build
  end

  def create
    @seller = current_seller
    @product = @seller.products.build(product_params)
    if @product.save
      redirect_to @seller, notice: 'Product added successfully.'
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :image, :category_id)
  end
end
