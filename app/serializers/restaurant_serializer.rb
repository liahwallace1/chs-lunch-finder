class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :yelp_id, :name, :address, :city, :state, :zip_code, :phone, :display_phone, :price, :takeout, :delivery, :yelp_rating, :image_url, :yelp_url, :latitude, :longitude, :categories, :category_list

  has_many :categories, through: :restaurant_categories


end
