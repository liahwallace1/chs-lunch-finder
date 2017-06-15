class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :city, :state, :phone, :price, :takeout, :delivery, :website, :yelp, :neighborhoods, :categories

  has_many :categories, through: :restaurant_categories
  has_many :neighborhoods, through: :restaurant_neighborhoods


end
