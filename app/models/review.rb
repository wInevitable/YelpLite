class Review < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_by_content, :against => :content

  validates :content, :rating, :author, :business, presence: true

  after_create :update_biz_rating

  belongs_to(
    :business,
    class_name: "Business",
    foreign_key: :business_id,
    inverse_of: :reviews
  )

  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :author_id,
    inverse_of: :reviews
  )

  def self.latest_activity
    latest_reviews = Review.find(:all, order: 'created_at desc', limit: 5)
  end
  
  private
  def update_biz_rating
    self.business.update_rating(self)
  end
end
