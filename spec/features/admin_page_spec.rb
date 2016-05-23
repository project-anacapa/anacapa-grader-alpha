require 'rails_helper.rb'

describe "the admin panel view", :type => :feature do
  before do
    @user = FactoryGirl.create(:admin)
    ApplicationController.any_instance.stub(:current_user).and_return(@user)
    login_as(@user, :scope => :user)
  end

  after do
    logout(@user)
  end

  it "should go to the admin page if you are an admin" do
    visit '/admin_panel'
    expect(page).to have_content 'Welcome, Admin! User Email User Name Administrator Instructor User ID test@example.com Test Name'
  end
  it "should go back to the homepage if you are not an admin" do
    @user.remove_role :admin
    visit '/admin_panel'
    expect(page).to have_content 'Coming Soon!'
  end
end