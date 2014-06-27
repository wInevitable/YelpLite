class Business < ActiveRecord::Base
  include PgSearch
  multisearchable :against => [:name, :address, :city_state_zip]

  validates :name, :city_state_zip, :address, :owner, presence: true
  validates :name, uniqueness: { scope: [:city_state_zip, :address],
    message: "with given address is already listed on YelpLite."}

  belongs_to(
    :owner,
    class_name: "User",
    foreign_key: :owner_id,
    inverse_of: :businesses
  )

  has_many(
    :reviews,
    dependent: :destroy,
    class_name: "Review",
    foreign_key: :business_id,
    inverse_of: :business
  )

  def update_rating(review)
    if self.num_ratings > 0
      self.num_ratings += 1
      self.rating += review.rating
    else
      self.num_ratings = 1
      self.rating = review.rating
    end

    self.update_attributes!({num_ratings: num_ratings, rating: rating})
  end

  def remove_rating(review)
    self.num_ratings -= 1
    self.rating -= review.rating
    self.update_attributes!({num_ratings: num_ratings, rating: rating})
  end

  def num_reviews
    self.num_ratings.to_s
  end

  def average_rating
    if self.num_ratings > 0
      self.rating / self.num_ratings
    else
      0
    end
  end
end
