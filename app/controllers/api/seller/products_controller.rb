# app/controllers/api/seller/products_controller.rb

class Api::Seller::ProductsController < ApplicationController
  def upload_image
    product = current_user.products.find(params[:product_id])

    if params[:image].present?
      product.update(image: params[:image])

      render json: { message: 'Product image uploaded successfully!' }, status: :ok
    else
      render json: { error: 'No image file selected!' }, status: :unprocessable_entity
    end
  rescue => e
    render json: { error: 'Product image upload failed!' }, status: :unprocessable_entity
  end
end
