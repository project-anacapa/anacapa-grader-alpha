require 'rails_helper'
require 'spec_helper'

RSpec.describe Course, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "has a valid factory" do
    FactoryGirl.create(:course).should be_valid
  end
  it "is invalid without a deptartment" do
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
