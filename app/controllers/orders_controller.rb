class OrdersController < ApplicationController
  before_action :authenticate_request, only: [:create, :destroy]
  def index
    orders = Order.all

    render json: orders except: [:created_at, :updated_at]
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
    order = Order.find_by(id: params[:id])
      if order
        order.destroy
        head :no_content
      else
        render_error("Order not found")
      end
  end

  private

  def order_params
    params.permit(:user_id, :order_date, :total_amount)
  end
end
