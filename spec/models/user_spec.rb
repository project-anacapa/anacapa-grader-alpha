require 'spec_helper'

describe User do
	before do
		@user = User.new
		@user.save
	end

	it "should have an is_admin method" do
		expect(@user).to respond_to(:is_admin)
	end

	it "should have return false if we haven't set the role" do
		expect(@user.is_admin).to be(false)
	end

	it "should have return false if we haven't set the role" do
		@user.add_role "admin"
		expect(@user.is_admin).to be(true)
	end
end
 