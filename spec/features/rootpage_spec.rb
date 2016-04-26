

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
		@request.env["devise.mapping"] = Devise.mappings[:user]
		@request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:github]

	end
	it "should log user in" do
		visit '/'
		click_button "Login"
		expect(page).to have_selector(:link_or_button, 'Logout')
	end
end

