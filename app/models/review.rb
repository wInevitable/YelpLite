class Review < ActiveRecord::Base
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
end
