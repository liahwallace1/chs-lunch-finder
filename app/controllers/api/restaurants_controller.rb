class Api::RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
    render json: {@restaurant.to_json(include: [:title])}
  end

  # Restaurant.all.to_json(include: [:type])

end
