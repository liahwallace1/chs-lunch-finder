class Api::RestaurantsController < ApplicationController

  def index
    Restaurant.get_yelp_data
    restaurants = Restaurant.all
    render json: restaurants
  end

  def show
    restaurant = Restaurant.find(params[:id])
    render json: restaurant
  end

  def update
    restaurant = Restaurant.find(params[:id])
    params[:hashtags_list].map do |hashtag|
      new_hashtag = Hashtag.find_by(name: hashtag)
      restaurant.hashtags << new_hashtag unless restaurant.hashtags.include?(new_hashtag)
    end

    if restaurant.save
      render json: Restaurant.all
    else
      render json: {message: "Dang! That didn't work."}, status: 412
    end
  end

  private

  def set_restaurant
  @restaurant ||= Restaurant.find_by_id(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:id, :yelp_id, :name, :address, :city, :state, :zip_code, :phone, :display_phone, :price, :takeout, :delivery, :yelp_rating, :yelp_url, :latitude, :longitude, category_ids: [])
  end

end
