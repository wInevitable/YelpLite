json.(review, :rating, :content, :created_at, :business_id, :author_id, :id)

json.author do
  json.partial! 'users/user.json', user: review.author
end

json.business do
  json.partial! 'businesses/business.json', business: review.business
end