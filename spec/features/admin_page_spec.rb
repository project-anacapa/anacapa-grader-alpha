require 'rails_helper.rb'

describe 'the admin panel view', :type => :feature do
  before do
    @user = FactoryGirl.create(:admin)
    ApplicationController.any_instance.stub(:current_user).and_return(@user)
    @user.save
    login_as(@user, :scope => :user)

  end

  after do
    logout(@user)
  end

  it 'should go to the admin page if you are an admin' do
    visit '/admin_panel'
    expect(page).to have_css('body > h1', :text => "Welcome, Admin!")
  end
  it 'should go back to the homepage if you are not an admin' do
    @user.remove_role :admin
    visit '/admin_panel'
    expect(page).to have_css('body > p', :text => "Coming Soon!")
  end

  it 'should toggle correctly into non-admin' do
    visit '/admin_panel'
    expect(page).to have_css('#admin_toggle_12345')
    page.uncheck('admin_toggle_12345')
    page.has_checked_field?('admin_toggle_12345').should be false
  end

  it 'should toggle correctly into admin' do
    visit '/admin_panel'
    expect(page).to have_css('#admin_toggle_12345')
    page.check('admin_toggle_12345')
    page.has_checked_field?('admin_toggle_12345').should be true
  end

  it 'should toggle correctly into non-instructor' do
    visit '/admin_panel'
    expect(page).to have_css('#instructor_toggle_12345')
    page.uncheck('instructor_toggle_12345')
    page.has_checked_field?('instructor_toggle_12345').should be false
  end

  it 'should toggle correctly into instructor' do
    visit '/admin_panel'
    expect(page).to have_css('#instructor_toggle_12345')
    page.check('instructor_toggle_12345')
    page.has_checked_field?('instructor_toggle_12345').should be true
  end

end