describe "the front page view", :type => :feature do
  it "shows the 'coming soon' message on the front page" do
    visit '/'
    expect(page).to have_content 'Coming Soon!'
  end
end