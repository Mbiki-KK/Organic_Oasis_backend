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

end
