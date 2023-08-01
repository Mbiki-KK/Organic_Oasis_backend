class UsersController < ApplicationController
  before_action :authenticate_request
  def index
    @users = User.all

    render json: @users
  end

  def show
    @user = User.find(params[:id])

    render json: @user
  end

  def create
    user = User.new(user_params)
      if user.save
        render json: user, status: :ok
      else
        render json: { errors: "Cannot add user" }, status: :unprocessable_entity
      end
  end

  def destroy

  end

  private

  def user_params
    params.permit(:name, :email, :password_digest, :contacts, :address, :type, :image, :reviews_id)
  end

end
