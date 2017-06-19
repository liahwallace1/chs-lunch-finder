class Api::RestaurantsController < ApplicationController

  # def yelp_create
  #   token_type = "Bearer"
  #   access_token = "JcepQW2RIj8xLRN3wsdEv8vfE-2KVkrXa_mCD_CSxM3uGJXx1IinL3UFm7Y57kSiYKQgQpE6gfNcyh-ICDhWvy7KTZ2saO8ZIcm83GAML8goEZ7CGNulh9j06dJCWXYx"
  #
  #   @resp = Faraday.get 'https://api.yelp.com/v3/businesses/search' do |req|
  #     req.headers['Authorization'] = "#{token_type} #{access_token}"
  #     req.params['term'] = "Food"
  #     req.params['location'] = "Charleston,+SC,+US"
  #     req.params['open_at'] = DateTime.now.noon.to_i
  #   end
  #
  #   body = JSON.parse(@resp.body)
  #
  #   if @resp.success?
  #     body["businesses"].map do |restaurant|
  #       new_rest = Restaurant.create(
  #       :name => restaurant["name"],
  #       :yelp_id => restaurant["id"],
  #       :address => restaurant["location"]["display_address"],
  #       :city => restaurant["location"]["city"],
  #       :state => restaurant["location"]["state"],
  #       :zip_code => restaurant["location"]["zip_code"],
  #       :phone => restaurant["phone"],
  #       :display_phone => restaurant["display_phone"],
  #       :price => restaurant["price"],
  #       :takeout => if restaurant["transactions"].include?("pickup"),
  #       :delivery => if restaurant["transactions"].include?("delivery"),
  #       :yelp_rating => restaurant["rating"]
  #       :yelp_url => restaurant["url"],
  #       :latitude => restaurant["coordinates"]["latitude"],
  #       :longitude => restaurant["coordinates"]["longitude"])
  #       restaurant["categories"].each do |category|
  #         cat = Category.find_or_create_by(title: category["title"])
  #         new_rest.categories << cat
  #       end
  #     end
  #   else
  #     @error = body["meta"]["errorDetail"]
  #   end
  #   render json: Restaurant.all
  #
  # end

  def index
    @restaurants = Restaurant.all
    render json: @restaurants
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    if @restaurant.save
      render json: Restaurant.all, success: "You added a restaurant!"
    else
      render json: {message: "Dang! That didn't work."}, status: 412
    end
  end

  def show
    set_restaurant
    render json: @restaurant
  end

  def destroy
    set_restaurant
    if @restaurant.delete
      render json: Restaurant.all, success: "Success! That crappy restaurant is out of rotation."
    else
      render json: {message: "Dang! That didn't work."}, status: 412
    end
  end

  private

  def set_restaurant
  @restaurant ||= Restaurant.find_by_id(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :city, :state, :phone, :price, :takeout, :delivery, :website, :yelp, neighborhood_ids: [], category_ids: [])
  end

end
