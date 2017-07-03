class CreateRestaurantHashtags < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurant_hashtags do |t|
      t.references :restaurant, foreign_key: true
      t.references :hashtag, foreign_key: true

      t.timestamps
    end
  end
end
