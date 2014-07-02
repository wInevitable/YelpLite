json.(business, :id, :name, :address, :city_state_zip, :country, :phone_number, :website_url, :owner_id, :recent, :rating, :num_ratings, :created_at, :avatar, :lat, :long, :reviews)

json.owner do
  json.partial! 'users/user.json', user: business.owner
end