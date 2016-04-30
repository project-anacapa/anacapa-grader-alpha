require 'rails_helper.rb'

describe "cancancan and rolify should work", :type => :feature do
    before do
        @user = User.new
        @user.save
    end

    it "should be able to call has_role, add_role, etc" do
        assert (@user.has_role? "admin") == false
        @user.add_role "admin"
        assert (@user.has_role? "admin") == true
    end

end
