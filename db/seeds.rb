# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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
    #avatar
    #location

    rec = [true, false]

    owner { User.find(rand(1..100)) }
    name { Faker::Company.name }
    address { Faker::Address.street_address }

    city_state_zip do
      Faker::Address.city + ", " + Faker::Address.state + " "+ Faker::Address.zip
    end

    country { Faker::Address.country }
    phone_number { Faker::PhoneNumber.phone_number }
    website_url { Faker::Internet.url(name.downcase.gsub(/\s+/, "")) }
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
    #improve content

    rating { rand(1..5) }
    author { User.find(rand(1..100)) }
    business { Business.find(rand(1..50)) }

    content do
      [Faker::Company.catch_phrase, Faker::Company.bs, Faker::Lorem.word].sample
    end

    created_at do
      author.created_at.days.ago
    end
  end
end

FactoryGirl.create_list(:user, 100)
FactoryGirl.create_list(:business, 50)
FactoryGirl.create_list(:review, 150)