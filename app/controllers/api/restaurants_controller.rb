class Api::RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
    render json: @restaurants
  end

  def create

  end

  def show
    set_restaurant
    render json: @restaurant
  end

  private

  def set_restaurant
  @restaurant ||= Restaurant.find_by_id(params[:id])
end

end
