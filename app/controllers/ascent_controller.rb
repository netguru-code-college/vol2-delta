class AscentController < ApplicationController
  before_action :set_ascent, only: [:show, :edit, :update, :destroy]

  # GET /lists
  def index
    @ascents = Ascent.all
  end

  # GET /lists/1
  def show
  end

  # GET /lists/new
  def new
    @ascent = Ascent.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  def create
    @ascent = Ascent.new(list_params)

    if @ascent.save

      # dodanie przejścia do route
      redirect_to @ascent, notice: 'Ascent was successfully added to database.'
    else
      render :new
    end
  end

  # def add_climbing_route
  #   # params[:x], params[y]
  #   cs = ClimbingRouteServices::AddClimbingRoute.new(Mountain.first.id, clibing_params)
  #   if cs.present?
  #     rediredt_to some_path, message: 'yeeey'
  #     gc = UserServices::CheckCouponAvailability.new
  #     if gc.present?
  #       CouponServices::GenerateCoupon
  #     else 
  #       redirect_to root_path, message: 'go home'
  #     end
  #   else 
  #     redirect_to root_path, error: 'smth goes wrong'
  #   end   

  # end
  def add_climbing_route
    ClimbingRouteServices::AddClimbingRoute.new(ClimbingRoute.name, climbing_route_params)
  end

  # PATCH/PUT /lists/1
  def update
    if @ascent.update(list_params)
      redirect_to @ascent, notice: 'Ascent was successfully updated.'
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
    def list_params
      params.require(:ascent).permit(:grade, :comment, :date, :style)
    end

    def climbing_route_params
       @climbing_route = ClimbingRoute.find(params[:name])
    end
end
