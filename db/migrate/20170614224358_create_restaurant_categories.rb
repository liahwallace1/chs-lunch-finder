class CreateRestaurantCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurant_categories do |t|
      t.references :restaurant, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
