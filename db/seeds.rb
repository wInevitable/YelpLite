# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create!(email: 'john@example.com', password: 'secret', fname: 'John', lname: 'Doe')
user2 = User.create!(email: 'guest@example.com', password: 'secret', fname: 'Guest', lname: 'Account')

business1 = Business.create!(name: 'App Academy', address: 'Cooper Square', city_state_zip: 'New York, NY 10003', owner: user1)
business2 = Business.create!(name: 'Major League Gaming', address: 'Park Avenue', city_state_zip: 'New York, NY', owner: user2)

Review.create!(content: "Top notch coding!", rating: 5, author: user1, business: business1)
Review.create!(content: "#ragequit", rating: 4, author: user1, business: business2)
Review.create!(content: "Yay!", rating: 4, author: user2, business: business1)