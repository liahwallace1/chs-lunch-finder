class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :phone
      t.string :display_phone
      t.string :price
      t.boolean :takeout
      t.boolean :delivery
      t.float :yelp_rating
      t.string :yelp_url
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
