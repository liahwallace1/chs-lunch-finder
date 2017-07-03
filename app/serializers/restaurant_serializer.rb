class RestaurantSerializer < ActiveModel::Serializer
  has_many :categories, through: :restaurant_categories
  has_many :hashtags, through: :restaurant_hashtags

  attributes :id, :yelp_id, :name, :address, :city, :state, :zip_code, :phone, :display_phone, :price, :takeout, :delivery, :yelp_rating, :image_url, :yelp_url, :latitude, :longitude, :category_list, :hashtags_list, :categories

  def hashtags_list
    list = []
    object.hashtags.map do |hashtag|
      list << hashtag.name
    end
    return list.join(", ")
  end


end
