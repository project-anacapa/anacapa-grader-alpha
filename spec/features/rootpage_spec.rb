require 'rails_helper.rb'

describe "the front page view", :type => :feature do
  it "shows the 'coming soon' message on the front page" do
    visit '/'
    expect(page).to have_content 'Coming Soon!'
  end
  it "has a login button" do
  	visit '/'
  	expect(page).to have_selector(:link_or_button, 'Login')
  end
end

describe "login process", :type => :feature do
	before do 
		Rails.application.env_config["devise.mapping"] = Devise.mappings[:user]
		Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:github]

	end
	it "should log user in" do
		visit '/'
		click_link "Login"
		expect(page).to have_selector(:link_or_button, 'Logout')
	end

	it "should log user in and out" do
		visit '/'
		click_link "Login"
		expect(page).to have_selector(:link_or_button, 'Logout')
		click_link "Logout"
		expect(page).to have_selector(:link_or_button, 'Login')
	end
end

