class ReviewsController < ApplicationController
  def index
    reviews = Review.all

    render json: reviews
  end

  def show
    review = Review.find_by(id: params[:id])

    render json: review, include: :users, :products
  end

  def create
    review = Review.new(review_params)
      if review.save
        render json: review, status: :ok
      else
        render json: { errors: "Cannot add review" }, status: :unprocessable_entity
      end
  end

  def destroy
  end


  private

  def review_params
    params.permit(:comment, :review_date, :user_id, :product_id)
  end
end
