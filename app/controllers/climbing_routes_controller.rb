class ClimbingRoutesController < ApplicationController
  attr_accessor :name, :grade, :number_of_ascents, :route_grade_id

  before_action :fetch_climbing_route, only: %i[show update edit destroy]
  def index
    @climbing_routes = ClimbingRoute.in_crag_and_sector(
      params[:sector_id],
      params[:crag_id]
    )
  end

  def new
    @climbing_route = ClimbingRoute.new
  end

  def create
    @climbing_route = ClimbingRoute.new(climbing_route_params)

    if @climbing_route.save
      redirect_to crag_sector_climbing_route_path(
        @climbing_route.sector.crag,
        @climbing_route.sector,
        @climbing_route
      ), notice: 'Climbing route was successfully created.'
    else
      render :new
    end
  end

  def update
    if @climbing_route.update(climbing_route_params)
      redirect_to crag_sector_climbing_route_path(
        @climbing_route.sector.crag,
        @climbing_route.sector,
        @climbing_route
      ), notice: 'Climbing route was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @climbing_route.destroy
    redirect_to crag_sector_climbing_routes_path, notice: 'Climbing route was successfully destroyed.'
  end

  def show_all_climbing_routes
    @climbing_routes = ClimbingRoute.show_all_climbing_routes.paginate(:page => params[:page], :per_page => 25)
  end

  private

  def fetch_climbing_route
    @climbing_route = ClimbingRoute.find(params[:id]).decorate
  end

  def climbing_route_params
    params.require(:climbing_route).permit(:name, :number_of_ascents, :sector_id, :route_grade_id)
  end
end
