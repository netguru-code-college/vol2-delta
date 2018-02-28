class UserProfileController < ApplicationController
  def show
    @user = User.eager_load(:ascents).find(params[:id])
    @ascents = @user.ascents.page(params[:page]).per(10)
  end
end
