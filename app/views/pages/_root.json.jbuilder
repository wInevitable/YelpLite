json.users do
  json.partial! 'users/user.json', collection: @users, as: :user
end

json.reviews do
  json.partial! 'reviews/review.json', collection: @reviews, as: :review
end
