class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :phone
      t.integer :price
      t.boolean :takeout
      t.boolean :delivery
      t.string :website
      t.string :yelp

      t.timestamps
    end
  end
end
