class UserProfileController < ApplicationController
  def show
    @user = User.eager_load(:ascents).find(params[:id])

  end
end
