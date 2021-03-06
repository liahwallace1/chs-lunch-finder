
#Create categories visible on yelp
Category.create(title: "Restaurants")
Category.create(title: "Food")
Category.create(title: "Nightlife")
Category.create(title: "Bars")
Category.create(title: "Sandwiches")
Category.create(title: "American (Traditional)")
Category.create(title: "Breakfast & Brunch")
Category.create(title: "Seafood")
Category.create(title: "Pizza")
Category.create(title: "Fast Food")
Category.create(title: "American (New)")
Category.create(title: "Burgers")
Category.create(title: "Salad")
Category.create(title: "Mexican")
Category.create(title: "Coffee & Tea")
Category.create(title: "Southern")
Category.create(title: "Italian")
Category.create(title: "Cafes")
Category.create(title: "Delis")
Category.create(title: "Chinese")
Category.create(title: "Barbeque")
Category.create(title: "Chicken Wings")
Category.create(title: "Japanese")
Category.create(title: "Sports Bars")
Category.create(title: "Bakeries")
Category.create(title: "Sushi Bars")
Category.create(title: "Specialty Food")
Category.create(title: "Diners")
Category.create(title: "Cocktail Bars")
Category.create(title: "Pubs")
Category.create(title: "Asian Fusion")
Category.create(title: "Thai")
Category.create(title: "Soup")
Category.create(title: "Beer Bar")
Category.create(title: "Mediterranean")


#create hashtags
hashtags = ["#cheapAF", "#spendy", "#counterservice", "#crowded", "#light", "#vegfriendly", "#caffinate", "#wifi", "#nowifi", "#napinducing", "#amazeballs", "#bestservice", "#smallspace", "#PIZZA", "#coolkids", "#leftovers", "#bestbrews", "#yoprocentral", "#tourons", "#noparking", "#parkinglot", "#fancy", "#quick", "#healthy"]


hashtags.map do |hashtag|
  Hashtag.find_or_create_by(name: hashtag)
end
