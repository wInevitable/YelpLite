json.users do
  json.partial! 'users/user.json', collection: @users, as: :user
end

json.business do
  json.partial! 'businesses/business.json', business: @business
end

json.reviews do
  json.partial! 'reviews/review.json', collection: @reviews, as: :review
end