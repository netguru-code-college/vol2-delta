class AscentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_ascent, only: [:show, :edit, :update, :destroy]
  before_action :climbing_route_params, only: [:new, :create, :show, :edit, :update, :destroy]

  def index
    @ascents = Ascent.all
  end

  def show
  end

  def edit
  end

  def new
    @ascent = Ascent.new
  end

  def create
    @ascent = Ascent.new(ascent_params)
    AscentServices::CalculatePoints.new(ascent: @ascent).call
    if @ascent.save
      AscentServices::CalculateUserTotalPoints.new(ascent: @ascent).call
      redirect_to crag_sector_climbing_route_path(
        @ascent.climbing_route.sector.crag,
        @ascent.climbing_route.sector,
        @ascent.climbing_route
      ),
      notice: 'Ascent was successfully added to database.'
    else
      render :new, notice: 'Missing fields'
    end
  end

  def update
    if @ascent.update(ascent_params)
      redirect_to show_user_path(current_user), notice: 'Ascent was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @ascent.destroy
    redirect_to show_user_path(current_user), notice: 'Ascent was successfully deleted.'
  end

  private

  def set_ascent
    @ascent = Ascent.find(params[:id])
  end

  def ascent_params
    params.require(:ascent).permit(:comment, :date, :user_id, :ascent_style_id, :climbing_route_id)
  end

  def climbing_route_params
    @climbing_route = ClimbingRoute.eager_load(sector: :crag).find(params[:climbing_route_id])
  end

  def set_user
    @user = current_user
  end
end
