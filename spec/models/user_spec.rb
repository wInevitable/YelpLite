require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "validations" do
    it { should validate_presence_of(:email)}
    it { should validate_presence_of(:fname)}
    it { should validate_presence_of(:lname)}
    it { should ensure_length_of(:password).is_at_least(6)}
  end

  describe "error messages" do
    it "fails validation with no first name expecting a specific message" do
      no_name = User.new({lname: "smith"})
      no_name.valid?
      expect(no_name.errors.messages[:fname]).to include("can't be blank")
    end

    it "fails validation with an invalid first name expecting a specific message" do
      incorrect_name = User.new({fname: "12wer"})
      incorrect_name.valid?
      expect(incorrect_name.errors.messages[:fname]).to include("must not contain numbers, symbols, or spaces.")
    end

    it "fails validation with no last name expecting a specific message" do
      no_name = User.new({fname: "smith"})
      no_name.valid?
      expect(no_name.errors.messages[:lname]).to include("can't be blank")
    end

    it "fails validation with an invalid last name expecting a specific message" do
      incorrect_name = User.new({lname: "12wer"})
      incorrect_name.valid?
      expect(incorrect_name.errors.messages[:lname]).to include("must not contain numbers, symbols, or spaces.")
    end
  end

  describe "associations" do
    it { should have_many(:businesses)}
    #it { should have_many(:reviews)}
  end
end


# doesn't accept wonky emails
# emails unique
# fname and lname are alphanumeric

#test error messages?