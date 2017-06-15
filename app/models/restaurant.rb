class Restaurant < ApplicationRecord
  has_many :restaurant_categories
  has_many :categories, through: :restaurant_categories
  has_many :restaurant_neighborhoods
  has_many :neighborhoods, through: :restaurant_neighborhoods


end
