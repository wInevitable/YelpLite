require 'rails_helper'

RSpec.describe Business, :type => :model do
  describe "validations" do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:address)}
    it { should validate_presence_of(:city_state_zip)}

    it "validates uniqueness of name in address and ciy_state_zip" do
      fried_foods = Business.create!(name: "KFC", address: "4 Park Avenue", city_state_zip: "Manhattan, NY 10003", owner_id: 1)
      fried_foods_copy = Business.new(name: "KFC", address: "4 Park Avenue", city_state_zip: "Manhattan, NY 10003", owner_id: 2)

      expect(fried_foods_copy).not_to be_valid
    end
  end

  describe "associations" do
    it { should belong_to(:owner)}
    #it { should have_many(:reviews)}
  end
end


#uniqueness of name in city_state_zip