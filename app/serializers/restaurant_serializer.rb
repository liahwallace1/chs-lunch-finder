class RestaurantSerializer < ActiveModel::Serializer
  attributes :yelp_id, :name, :address, :city, :state, :zip_code, :phone, :display_phone, :price, :takeout, :delivery, :yelp_rating, :yelp_url, :latitude, :longitude, :categories

  has_many :categories, through: :restaurant_categories

end
