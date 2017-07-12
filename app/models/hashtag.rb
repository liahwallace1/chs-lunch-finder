class Hashtag < ApplicationRecord
  has_many :restaurant_hastags
  has_many :hashtags, through: :restaurant_hastags


end
