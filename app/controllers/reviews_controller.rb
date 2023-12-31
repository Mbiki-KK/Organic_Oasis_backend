class ReviewsController < ApplicationController
  before_action :authenticate_request, except: [:index, :show]
  def index
    reviews = Review.all

    render json: reviews
  end

  def show
    review = Review.find_by(id: params[:id])

    render json: review
  end

  def create
    review = Reviews.new(review_params)
    if review.save
      render json: review
    else
      render json: {error: "Review not found"}, status: :not_found
    end
  end

  def destroy
  end


  private

  def review_params
    params.permit(:review, :reviewer_name)
  end
end
