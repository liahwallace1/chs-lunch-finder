class CreateRestaurantNeighborhoods < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurant_neighborhoods do |t|
      t.references :restaurant, foreign_key: true
      t.references :neighborhood, foreign_key: true

      t.timestamps
    end
  end
end
