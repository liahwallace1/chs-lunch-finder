class RestaurantNeighborhood < ApplicationRecord
  belongs_to :restaurant
  belongs_to :neighborhood
end
