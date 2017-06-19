class Restaurant < ApplicationRecord
  has_many :restaurant_categories
  has_many :categories, through: :restaurant_categories
  has_many :restaurant_neighborhoods
  has_many :neighborhoods, through: :restaurant_neighborhoods

  validates :yelp_id, :uniqueness => true


  def self.get_yelp_data
    token_type = "Bearer"
    access_token = "JcepQW2RIj8xLRN3wsdEv8vfE-2KVkrXa_mCD_CSxM3uGJXx1IinL3UFm7Y57kSiYKQgQpE6gfNcyh-ICDhWvy7KTZ2saO8ZIcm83GAML8goEZ7CGNulh9j06dJCWXYx"

    resp = Faraday.get 'https://api.yelp.com/v3/businesses/search' do |req|
      req.headers['Authorization'] = "#{token_type} #{access_token}"
      req.params['term'] = "Food"
      req.params['location'] = "Charleston,+SC,+US"
      req.params['open_at'] = DateTime.now.noon.to_i
    end

    body = JSON.parse(resp.body)

    if resp.success?
      self.save_yelp_data(body)
    else
      @error = body["meta"]["errorDetail"]
    end
  end

  def self.save_yelp_data(data)
    data["businesses"].map do |restaurant|
        new_rest = Restaurant.find_or_create_by(
          :yelp_id => restaurant["id"])
        new_rest.update(
        :name => restaurant["name"],
        :address => restaurant["location"]["display_address"],
        :city => restaurant["location"]["city"],
        :state => restaurant["location"]["state"],
        :zip_code => restaurant["location"]["zip_code"],
        :phone => restaurant["phone"],
        :display_phone => restaurant["display_phone"],
        :price => restaurant["price"],
        :takeout => if restaurant["transactions"].include?("pickup"),
        :delivery => if restaurant["transactions"].include?("delivery"),
        :yelp_rating => restaurant["rating"]
        :yelp_url => restaurant["url"],
        :latitude => restaurant["coordinates"]["latitude"],
        :longitude => restaurant["coordinates"]["longitude"])

        restaurant["categories"].map do |category|
          cat = Category.find_or_create_by(title: category["title"])
          new_rest.categories << cat unless new_rest.categories.include?(cat)
        end
      end
  end

end
