class Review < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_by_content, :against => :content

  validates :content, :rating, :author, :business, presence: true

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
    # @refresh ||= Time.now
    # if ((Time.now - @refresh) > 120)
      latest_reviews = Review.find(:all, order: 'id desc', limit: 5)
    #   @refresh = Time.now
    # else
    #   @latest_reviews ||= Review.find(:all, order: 'id desc', limit: 5)
    # end
    #
    # @latest_reviews
  end
end
