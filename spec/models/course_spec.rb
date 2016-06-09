require 'rails_helper'

RSpec.describe Course, type: :model do
  it "has a valid factory" do
    FactoryGirl.create(:course).should be_valid
  end
  it "is invalid without a department"
  it "is invalid without a number"
  it "is invalid without a description"
  it "is invalid without a term"
end
