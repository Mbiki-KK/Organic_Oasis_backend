class OrdersController < ApplicationController
  before_action :authenticate_request, only: [:create, :destroy]
  def index
    orders = Order.all

    render json: orders
  end

  def show
    order = Order.find_by(id: params[:id])

    if order
      render json: order, status: :ok
    else
      render json: {error: "Order not found"}, status: :not_found
    end

  end

  def create
   order = Order.new(order_params)
      if order.save
        render json: order, status: :ok
      else
        render json: { errors: "Cannot add order" }, status: :unprocessable_entity
      end
  end

  def destroy
    product = Product.find_by(id: params[:id])
      if product
        product.destroy
        head :no_content
      else
        render_error("Song not found")
      end
  end

  private

  def order_params
    params.permit(:user_id, :order_date, :total_amount)
  end
end
