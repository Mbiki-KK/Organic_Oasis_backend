# app/controllers/api/images_controller.rb

c# app/controllers/api/images_controller.rb

class Api::ImagesController < ApplicationController
  def upload_image
    user = current_user # Make sure to implement authentication and get the current user

    if params[:image].present?
      user.update(image: params[:image])

      render json: { message: 'Profile picture updated successfully!' }, status: :ok
    else
      render json: { error: 'No image file selected!' }, status: :unprocessable_entity
    end
  rescue => e
    render json: { error: 'Profile picture update failed!' }, status: :unprocessable_entity
  end
end

