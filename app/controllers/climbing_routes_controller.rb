class ClimbingRoutesController < ApplicationController
  attr_accessor :name, :grade, :number_of_ascents, :route_grade_id
  before_action :fetch_climbing_route, only: %i[show update edit destroy]
  def index
    binding.pry
    @climbing_routes = ClimbingRoute.includes(sector: :crag)
                                    .in_crag_and_sector(params[:crag_id], params[:sector_id])
  end

  def new
    @climbing_route = ClimbingRoute.new
  end

  def create
    @climbing_route = ClimbingRoute.new(climbing_route_params)
    binding.pry
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

  def show; end

  def edit; end

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

  private

  def fetch_climbing_route
    @climbing_route = ClimbingRoute.find(params[:id]).decorate
  end

  def climbing_route_params
    params.require(:climbing_route).permit(:name, :number_of_ascents, :sector_id, :route_grade_id)
  end
end
