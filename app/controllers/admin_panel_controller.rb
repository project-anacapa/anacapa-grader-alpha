class AdminPanelController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admin_only
  def index
    @users = User.all
  end

  private

  def admin_only
    unless current_user.is_admin
      redirect_to :root, :alert => "You are not authorized to access this page."
    end
  end
end
