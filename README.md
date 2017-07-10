# Welcome to the What's For Lunch Charleston API!

What's For Lunch Charleston is a single page application with Rails API and React client side ([see the client repository](https://github.com/liahwallace1/chs-lunch-finder-client). This app can help people in Charleston pick a lunch restaurant, or it can suggest a place for them.

  - Utilizes Rails 5 API feature.
  - Uses Faraday to pull data from Yelp Fusion API
  - ActiveModel Serializers prepare JSON data for client side
  - Receives Hashtag associations with restaurants from client and updates database

## Video Walkthrough
  [Youtube Video](https://youtu.be/1YC1DSYAXeQ)

## Installation and Usage
  Clone this repository and the [Client Repository](https://github.com/liahwallace1/chs-lunch-finder-client), then execute:
  ```
  $ cd chs-lunch-finder-api
  $ bundle install
  $ rails s -p 3001


  $ cd chs-lunch-finder-client
  $ npm install
  $ npm start
  ```

### Tech

  What's For Lunch Charleston APIT uses a few open source projects to work properly:
  * [Ruby on Rails](https://github.com/rails/rails) - A web-application framework that includes everything needed to create database-backed web applications according to the Model-View-Controller (MVC) pattern.
  * [Active Record](https://github.com/rails/rails/tree/master/activerecord) - Connects classes to relational database tables.
  * [Yelp Fusion API](https://www.yelp.com/fusion) - Allows you to connect with data from over 50 million businesses.


  What's For Lunch Charleston itself is open source with a [public repository](https://github.com/liahwallace1/chs-lunch-finder-api)
   on GitHub.

## Contributing

  Bug reports and pull requests are welcome on GitHub at [this project's repository](https://github.com/liahwallace1/chs-lunch-finder-api). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

  This Web Application is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
