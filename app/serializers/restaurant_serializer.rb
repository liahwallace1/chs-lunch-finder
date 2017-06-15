class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :city, :state, :phone, :price, :takeout, :delivery, :website, :yelp, :categories

  has_many :categories, through: :restaurant_categories

end
