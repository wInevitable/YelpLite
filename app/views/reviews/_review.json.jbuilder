json.(review, :rating, :content, :created_at, :business_id, :author_id, :id)

json.author do
  json.partial! 'users/user', user: review.author
end

json.business do

end