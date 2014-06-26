module ReviewsHelper
  def reviews(model, n)
    reviews = []

    reviews.push(model.reviews.shuffle.take(n))

    reviews.first
  end
end
