json.reviews do
  json.partial! 'reviews/review', collection: @reviews, as: :review
end