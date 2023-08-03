class CategoriesController < ApplicationController
  before_action :authenticate_request, except: :index
  def index
    categories = Category.all

    render json: categories, except: [:created_at, :updated_at]
  end

  def show
    category = Category.find_by(id: params[:id])

    render json: category, status: :ok
  end

  def create
    category = Category.new(category_params)
      if category.save
        render json: category, status: :ok
      else
        render json: { errors: "Cannot add category" }, status: :unprocessable_entity
      end
  end

  def update
    category = Category.find_by(id: params[:id])
    if category
      if category.update(category_params)
        render json: category, status: :ok
      else
        render_validation_errors(category.errors.full_messages)
      end
    else
      render_error("Category not found")
    end
end

  def destroy
    category = Category.find_by(id: params[:id])
      if category
        category.destroy
        head :no_content
      else
        render json: {error: "Category not found"}
      end
  end

  private

  def category_params
    params.permit(:id, :name, :desc)
  end

end
