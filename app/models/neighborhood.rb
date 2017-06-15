class Neighborhood < ApplicationRecord
  has_many :restaurant_neighborhoods
  has_many :neighborhoods, through: :restaurant_neighborhoods
end
