module ReviewsHelper
  def reviews(model, n)
    reviews = []

    reviews.push(model.reviews.shuffle.take(n))

    reviews.first
  end

  def time_ago(review)
    "#{((Time.now - review.created_at)/60).to_i} minutes ago"
  end
end
