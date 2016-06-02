class PromotionsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_user
  def update
    @user.add_role @role
    head :no_content
  end

  def destroy
    @user.remove_role @role
    head :no_content
  end

  private

  def load_user
    @user = User.find(params[:user_id])
  end
end
