class AscentsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]
before_action :set_ascent, only: [:show, :edit, :update, :destroy]
before_action :climbing_route_params, only: [:new, :create, :show, :edit, :update, :destroy]
 # before_action :set_user, only: [:new, :create, :show]

def index
  @ascents = Ascent.all
end

def show
end

def new
  @ascent = Ascent.new
end

def edit; end

def create
  @ascent = Ascent.new(ascent_params)
  if @ascent.save
    redirect_to ascents_path, notice: 'Ascent was successfully added to database.'
  else
    render :new, notice: 'Missing fields'
  end
end

def update
  if @ascent.update(ascent_params)
    redirect_to ascents_url, notice: 'Ascent was successfully updated.'
  else
    render :edit
  end
end

def destroy
  @ascent.destroy
  redirect_to ascents_url, notice: 'Ascent was successfully deleted.'
end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_ascent
    @ascent = Ascent.find(params[:id])
  end
  # Only allow a trusted parameter "white list" through.
  def ascent_params
    params.require(:ascent).permit(:comment, :date, :style)
  end
  # Find climbing route to add ascent.
  def climbing_route_params
    @climbing_route = ClimbingRoute.eager_load(sector: :crag).find(params[:climbing_route_id])
  end

  def set_user
    @user = current_user
  end
end
