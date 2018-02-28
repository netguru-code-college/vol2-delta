class AscentController < ApplicationController
  before_action :set_ascent, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

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

  # POST /lists
  def create
    @ascent = Ascent.new(ascent_params)

    if @ascent.save
      # add_climbing_route
      redirect_to ascents_path, notice: 'Ascent was successfully added to database.'
    else
      render :new
    end
  end

<<<<<<< HEAD:app/controllers/ascents_controller.rb
  # GET /lists/1/edit
  def edit
=======
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
    climbing_routes_service = ClimbingRouteServices::AddClimbingRoute.new(ClimbingRoute.id, climbing_route_params)
    # if climbing_routes_service.present?
    #   redirect_to
>>>>>>> basic user authentication:app/controllers/ascent_controller.rb
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

    def add_climbing_route
      # climbing_routes_service = ClimbingRouteServices::AddClimbingRoute.new(climbing_route_params)
      # if climbing_routes_service.present?
      #   redirect_to
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
