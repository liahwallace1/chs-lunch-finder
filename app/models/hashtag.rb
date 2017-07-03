class Hashtag < ApplicationRecord
  has_many :restaurant_hastags
  has_many :hashtags, through: :restaurant_hastags


  hashtags = ["#cheapAF", "#counterservice", "#crowded", "#light", "#vegfriendly", "#caffinate", "#wifi", "#nowifi", "#napinducing", "#amazeballs", "#bestservice", "#smallspace", "#PIZZA", "#coolkids", "#leftovers"]

  def self.create_hashtags(hashtags)
    hashtags.map do |hashtag|
      Hashtag.find_or_create_by(name: hashtag)
    end
  end


end
