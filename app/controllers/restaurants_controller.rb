class Api::RestaurantsController < ApplicationController

  def index
    render json: Restaurant.all.to_json(include: [:type])
  end

end
