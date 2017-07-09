class Restaurant < ApplicationRecord
  has_many :restaurant_categories
  has_many :categories, through: :restaurant_categories
  has_many :restaurant_hashtags
  has_many :hashtags, through: :restaurant_hashtags

  validates :yelp_id, :uniqueness => true


  def self.clear_restaurants
    RestaurantCategory.delete_all
    self.delete_all
  end

  def self.get_yelp_data
    token_type = "Bearer"
    access_token = "JcepQW2RIj8xLRN3wsdEv8vfE-2KVkrXa_mCD_CSxM3uGJXx1IinL3UFm7Y57kSiYKQgQpE6gfNcyh-ICDhWvy7KTZ2saO8ZIcm83GAML8goEZ7CGNulh9j06dJCWXYx"

    resp = Faraday.get 'https://api.yelp.com/v3/businesses/search' do |req|
      req.headers['Authorization'] = "#{token_type} #{access_token}"
      req.params['term'] = "Food"
      req.params['location'] = "29401,+29403"
      req.params['limit'] = "50"
      req.params['open_at'] = DateTime.now.noon.to_i
    end
    
    body = JSON.parse(resp.body)

      if resp.success?
        # self.delete_old_restaurants(body)
        self.save_yelp_data(body)
      else
        @error = body["meta"]["errorDetail"]
      end
  end

  def self.save_yelp_data(data)
    data["businesses"].map do |restaurant|
      new_rest = Restaurant.find_or_create_by(
        yelp_id: restaurant["id"])
      new_rest.update_attributes_from_api(restaurant)
      new_rest.update_categories_from_api(restaurant["categories"])
      new_rest.save
    end
  end

  def self.delete_old_restaurants(data)
    self.all.map do |restaurant|
      if !data["businesses"].include?(restaurant)
        RestaurantCategory.where(restaurant_id: restaurant.id).destroy_all
        RestaurantHashtag.where(restaurant_id: restaurant.id).destroy_all
        restaurant.destroy
      end
    end
  end

  def update_attributes_from_api(restaurant)
    self.name = restaurant["name"]
    self.address = restaurant["location"]["display_address"][0]
    self.city = restaurant["location"]["city"]
    self.state = restaurant["location"]["state"]
    self.zip_code = restaurant["location"]["zip_code"]
    self.phone = restaurant["phone"]
    self.display_phone = restaurant["display_phone"]
    self.price = restaurant["price"]
    restaurant["transactions"].include?("pickup") ? self.takeout = true : self.takeout = false
    restaurant["transactions"].include?("delivery") ? self.delivery = true : self.delivery = false
    self.yelp_rating = restaurant["rating"]
    self.image_url = restaurant["image_url"]
    self.yelp_url = restaurant["url"]
    self.latitude = restaurant["coordinates"]["latitude"]
    self.longitude = restaurant["coordinates"]["longitude"]
  end

  def update_categories_from_api(api_categories)
    api_categories.map do |category|
      new_cat = Category.find_or_create_by(title: category["title"])
      self.categories << new_cat unless self.categories.include?(new_cat)
    end
  end

  def category_list
    self.categories.map {|category| category.title}.join(", ")
  end

end
