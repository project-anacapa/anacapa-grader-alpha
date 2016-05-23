require 'rails_helper.rb'

describe "the admin panel view", :type => :feature do
  before do
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:github]
  end
  it "should go back to the homepage if not an admin" do
    visit '/admin_panel'
    expect(page).to have_content 'Coming Soon!'
  end
  it "should go back to the homepage when not logged in as an admin" do
    visit '/'
    #stub TODO write this test
  end
  it "should say 'Welcome, Admin!' when logged in as an admin" do
    visit '/'
    #stub TODO write this test
  end
end