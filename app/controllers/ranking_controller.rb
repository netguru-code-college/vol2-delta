class RankingController < ApplicationController
  def index
    @users = User.top_ten
  end
end
