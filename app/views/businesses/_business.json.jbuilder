json.(business, :id, :name, :address, :city_state_zip, :country, :phone_number, :website_url, :owner_id, :recent, :rating, :num_ratings, :avatar, :lat, :long, :reviews)

json.created_at business.created_at.strftime('%m/%d/%Y')
json.owner_name user_name(business.owner)
json.avatar_mini business.avatar.url(:mini)
json.avatar_thumb business.avatar.url(:thumb)
json.avatar_profile business.avatar.url(:profile)

json.owner do
  json.partial! 'users/user.json', user: business.owner
end