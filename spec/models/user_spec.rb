require 'rails_helper'

RSpec.describe User, type: :model do

  let(:valid_attributes) do {
    firstname: "venkat",
    lastname: "madhav",
    email: "venky@gmail.com"
  }
end

  let(:invalid_attributes) do {
    firstname: "",
    lastname: "madhav",
    email: "venky@gmail.com"
  }
  end
  describe "User with valid attributes" do
    it "User changed the count by 1" do
      expect{
        user = User.new valid_attributes
        user.save
      }.to change(User, :count).by(1)
    end
  end

  describe "User with invalid attributes" do
    it "User changed the count by 0" do
      expect{
        user = User.new invalid_attributes
        user.save
      }.to change(User, :count).by(0)
    end
  end
end
