# app/controllers/sellers_controller.rb
class SellersController < ApplicationController
  before_action :authenticate_seller!, except: [:index, :show]

  def index
    @sellers = Seller.all
  end

  def show
    @seller = Seller.find(params[:id])
  end
end

