class Business < ActiveRecord::Base
  validates :name, :city_state_zip, presence: true
  validates :name, uniqueness: { scope: :city_state_zip,
    message: "Business already has a page on YelpLite."}
    
  belongs_to(
    :owner,
    class_name: "User",
    foreign_key: :owner_id,
    inverse_of: :businesses
  )
end
