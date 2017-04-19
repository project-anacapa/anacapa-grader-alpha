require 'rails_helper'

RSpec.describe Course, type: :model do
  it "has a valid factory" do
    FactoryGirl.create(:course).should be_valid
  end

  describe "invalid initilization" do
    it "is invalid without a department" do
      FactoryGirl.build(:course, dept: nil).should_not be_valid
    end
    it "is invalid without a number" do
      FactoryGirl.build(:course, num: nil).should_not be_valid
    end
    it "is invalid without a description" do
      FactoryGirl.build(:course, desc: nil).should_not be_valid
    end
    it "is invalid without a term" do
      FactoryGirl.build(:course, term: nil).should_not be_valid
    end
  end

  it "should return the string in correct format" do
    FactoryGirl.create(:course).course_slug.should eq("Computer Science_170_S16")
  end
end
