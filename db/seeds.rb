# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

client = Yelp::Client.new
include Yelp::V2::Business::Request

FactoryGirl.define do
  factory :user do
    #avatar

    email { Faker::Internet.safe_email }
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
    rec = [true, false]
    owner { User.find(rand(1..50)) }

    name { response[:name] }
    avatar {response[:image_url] }
    address { response[:location][:address] }

    city_state_zip do
      response[:location][:city] + ", " + response[:location][:state_code]
        + " "+ response[:location][:postal_code]
    end

    display_address { response[:display_address] }
    country { response[:location][:country_code] }
    phone_number { response[:phone] }
    website_url { response[:url] }

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

    rating { response[:reviews][:rating] }
    author { User.find(rand(1..50)) }
    business { Business.last }

    content do
      response[:reviews][:excerpt]
    end

    created_at do
      author.created_at
    end
  end
end

FactoryGirl.create_list(:user, 50)

50.times do
  fake_city Faker::Address.city

  request = Location.new(
              term: 'food',
              city: fake_city
            )
  response = client.search(request)

  FactoryGirl.create(:business)
  FactoryGirl.create(:review)
end