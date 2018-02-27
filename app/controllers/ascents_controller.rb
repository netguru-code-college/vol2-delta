class AscentController < ApplicationController
  before_action :set_ascent, only: %i[show edit update destroy]

  # GET /lists
  def index
    @ascents = Ascent.all
  end

  # GET /lists/1
  def show; end

  # GET /lists/new
  def new
    @ascent = Ascent.new
  end

  # GET /lists/1/edit
  def edit; end

  # POST /lists
  def create
    @ascent = Ascent.new(ascent_params)

    if @ascent.save
      redirect_to ascents_path, notice: 'Ascent was successfully added to database.'
    else
      render :new
    end
  end

  # PATCH/PUT /lists/1
  def update
    if @ascent.update(ascent_params)
      redirect_to ascents_url, notice: 'Ascent was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /lists/1
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
    params.require(:ascent).permit(:grade, :comment, :date, :style)
  end

  # Find climbing route to add ascent.
  def climbing_route_params
     @climbing_route = ClimbingRoute.find(params[:id])
  end

end
  
