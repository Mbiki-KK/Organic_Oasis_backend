class HomeController < ApplicationController
  def index
    @meat = Meat.all
    @beverage = Beverage.all
    @bakery = Bakery.all
    @spices = Spice.all
    @cereal = Cereal.all
    @dairy = Dairy.all
    @offers = Offer.all
    @veggies_and_fruits = VeggiesAndFruit.all
  end
end
