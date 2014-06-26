class Business < ActiveRecord::Base
  validates :name, :city_state_zip, :address, presence: true
  validates :name, uniqueness: { scope: [:city_state_zip, :address],
    message: "with given address is already listed on YelpLite."}

  belongs_to(
    :owner,
    class_name: "User",
    foreign_key: :owner_id,
    inverse_of: :businesses
  )

  # has_many(
  #   :reviews,
  #   class_name: "Review",
  #   foreign_key: :business_id,
  #   inverse_of: :business
  # )
end
