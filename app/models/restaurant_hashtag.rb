class RestaurantHashtag < ApplicationRecord
  belongs_to :restaurant
  belongs_to :hashtag
end
