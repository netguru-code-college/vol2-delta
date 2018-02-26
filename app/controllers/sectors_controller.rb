class SectorsController < ApplicationController
  before_action :set_sector, only: [:show, :edit, :destroy]

  def index
    @sectors = Sector.all
  end

  def show
  end

  def new
    @sector = Sector.new
  end

  def create
    @sector = Sector.new(sector_params)
    if @sector.save
      redirect root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @sector.destroy
      redirect
  end
  private

  def set_sector
      @sector = Sector.find(params[:id])
  end

  def sector_params
    params.require(:sector).permit(:name, :aspect, :x, :y, :crag_id)
  end
end
