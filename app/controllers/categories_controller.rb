class CategoriesController < ApplicationController
  before_action :authenticate_request, except: :index
  def index
    categories = Category.all

    render json: categories, status: :ok
  end

  def show
    category = Category.find_by(id: params[:id])

    render json: category, status: :ok
  end

end
