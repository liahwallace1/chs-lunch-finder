class Api::RestaurantsController < Api::BaseController

  def create respond_with :api, :v1, Item.create(item_params) end
    def destroy respond_with Item.destroy(params[:id]) end
      def update item = Item.find(params["id"]) item.update_attributes(item_params) respond_with item, json: item end

  def index
    respond_with Restaurant.all
  end

  def create
    restaurant = Restaurant.create(restaurant_params)
    if restaurant.save
      respond_with Restaurant.all, success: "You added a restaurant!"
    else
      respond_with {message: "Dang! That didn't work."}, status: 412
    end
  end

  def show
    set_restaurant
    respond_with :api, @restaurant
  end

  def destroy
    # set_restaurant
    # if @restaurant.destroy
    #   render json: Restaurant.all, success: "Success! That crappy restaurant is out of rotation."
    # else
    #   render json: {message: "Dang! That didn't work."}, status: 412
    # end
    respond_with Restaurant.destroy(params[:id])
  end

  private

  def set_restaurant
  @restaurant ||= Restaurant.find_by_id(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:yelp_id, :name, :address, :city, :state, :zip_code, :phone, :display_phone, :price, :takeout, :delivery, :yelp_rating, :yelp_url, :latitude, :longitude, category_ids: [])
  end

end
