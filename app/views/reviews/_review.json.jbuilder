json.(review, :rating, :content, :business_id, :author_id, :id)

json.created_at review.created_at.strftime('%m/%d/%Y')
json.time_ago time_ago(review)
json.author_name user_name(review.author)
json.business_name review.business.name

json.author do
  json.partial! 'users/user.json', user: review.author
end

json.business do
  json.partial! 'businesses/business.json', business: review.business
end