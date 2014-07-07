# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'flickr'

flickr = Flickr.new(
  api_key: ENV['FLICKR_KEY'],
  shared_secret: ENV['FLICKR_SECRET'],
  tags: 'people'
)
$photos = flickr.photos

client = Yelp::Client.new
include Yelp::V2::Search::Request

$cities = ['New York City', 'San Francisco', 'Houston', 'Philadelphia',
           'Baltimore', 'Berlin', 'Paris', 'Dallas', 'Los Angeles',
           'Chicago', 'Raleigh', 'Washinton D.C.', 'Seattle', 'San Diego',
           'San Jose', 'Palo Alto', 'Amsterdam', 'Atlanta', 'Boston', 'Toronto']

$terms = ['food', 'seafood', 'dessert', 'thai', 'chinese', 'italian',
         'mexican', 'spicy', 'polish', 'middle eastern', 'pizza', 'american',
         'automotive', 'nightlife', 'shopping']

FactoryGirl.define do
  factory :user do
    avatar { $photos.shift.source }

    email do
      Faker::Internet.safe_email
      # cond = false
      # until cond
      #   cond = true
      #   e = Faker::Internet.safe_email
      #   if User.where("email = ?", e)
      #     cond = false
      #   end
      # end
      # return e
    end

    password { Faker::Internet.password(6) }
    fname { Faker::Name.first_name }
    lname { Faker::Name.last_name }
    nickname { Faker::Name.title }
    location { Faker::Internet.ip_v4_address }
    hometown { Faker::Address.city }
    created_at { rand(3000).days.ago }

    things_i_love do
      [Faker::Commerce.color, Faker::Commerce.department,
       Faker::Commerce.product_name].join(", ")
    end
  end

  factory :business do
    #grab business from Yelp
    request = Location.new(
                term: $terms.sample,
                city: $cities.sample
              )
    response = client.search(request)
    business = response["businesses"].sample

    rec = [true, false]
    owner { User.find(rand(1..25)) }

    name { business["name"] }
    avatar { business["image_url"] }
    address { business["location"]["address"][0] }

    city_state_zip do
      business["location"]["city"] + ", " + business["location"]["state_code"] + " " + business["location"]["postal_code"]
    end

    display_address { business["location"]["display_address"].join(", ") }
    country { business["location"]["country_code"] }
    phone_number { business["phone"] }
    website_url { business["url"] }

    recent { rec.sample }

    created_at do
      if recent
        rand(100).days.ago
      else
        rand(3000).days.ago
      end
    end
  end

  factory :review do
    #grab review from Yelp
    request = Location.new(
                term: $terms.sample,
                city: $cities.sample
              )
    response = client.search(request)

    rating { rand(1..5) }
    author { User.find(rand(2..25)) }
    business { Business.find(rand(1...2)) }

    content do
      response["businesses"].sample["snippet_text"]
    end

    created_at do
      author.created_at
    end
  end
end

FactoryGirl.create_list(:user, 25)
FactoryGirl.create_list(:business, 5)
FactoryGirl.create_list(:review, 25)
User.create!(email: "demo@yelplite.com", password: "secret",
  fname: "John", lname: "Doe")