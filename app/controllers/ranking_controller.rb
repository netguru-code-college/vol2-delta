class RankingController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @users = User.top_ten
  end
end
