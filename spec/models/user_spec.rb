require 'rails_helper'

RSpec.describe User, type: :model do

  describe "validations" do
    subject{
      described_class.new(
        email: "this@test.com",
        first_name: "Dude",
        last_name: "Man",
        password: "testpass",
        password_confirmation: "testpass"
      )
    }

    it "should have a unique email" do
      subject2 = User.new(
        email: "this@test.com", 
        first_name: "Broseph", 
        last_name: "Radington", 
        password: "thing", 
        password_confirmation:"thing"
      )
      subject.save
      subject2.save
      expect(subject).to be_valid
      expect(subject2).to_not be_valid
      expect(subject2.errors[:email]).to include("has already been taken")
    end

    it "should have all valid attributes" do
      expect(subject).to be_valid
    end

    it "should have a matching password and password confirmation" do
      subject.password_confirmation = "tiestspass"
      expect(subject).to_not be_valid
    end
  end
end
