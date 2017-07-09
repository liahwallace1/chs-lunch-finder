class Api::HashtagsController < ApplicationController

  def index
    hashtags = Hashtag.all.order(:name)
    render json: hashtags
  end

  # def create
  #   restaurant = Restaurant.create(restaurant_params)
  #   if restaurant.save
  #     render json: Restaurant.all, success: "You added a restaurant!"
  #   else
  #     render json: {message: "Dang! That didn't work."}, status: 412
  #   end
  # end
  #
  # def show
  #   set_restaurant
  #   render json: @restaurant
  # end
  #
  # def destroy
  #   set_restaurant
  #   if @restaurant.delete
  #     render json: Restaurant.all, success: "Success! That crappy restaurant is out of rotation."
  #   else
  #     render json: {message: "Dang! That didn't work."}, status: 412
  #   end
  # end
  #
  # private
  #
  # def set_restaurant
  # @restaurant ||= Restaurant.find_by_id(params[:id])
  # end
  #
  # def restaurant_params
  #   params.require(:restaurant).permit(:yelp_id, :name, :address, :city, :state, :zip_code, :phone, :display_phone, :price, :takeout, :delivery, :yelp_rating, :yelp_url, :latitude, :longitude, category_ids: [])
  # end

end
