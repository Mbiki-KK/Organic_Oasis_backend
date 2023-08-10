class OrderItemsController < ApplicationController
  def index
    order_items = OrderItem.all
    render json: order_items, except: [:created_at, :updated_at]
  end
  def show
    order_item = OrderItem.find_by(id: params[:id])
    if order_item
      render json: order_item, status: :ok
    else
      render json: {error: "Order Item not found"}, status: :not_found
    end
  end
  def create
    order_item = OrderItem.new(order_params)
      if order_item.save
        render json: order_item, status: :ok
      else
        render json: { errors: "Cannot add order_item" }, status: :unprocessable_entity
      end
  end
  def destoy
    order_item = OrderItem.find_by(id: params[:id])
      if order_item
        order_item.destroy
        head :no_content
      else
        render_error("Order Item not found")
      end
  end
end
