module ClimbingRouteService
  class AddClimbingRoute
    attr_accesor :name, :grade, :climbing_route

    def initialize(climbing_route_name, climbing_route_params)
      @name = climbing_route_params[:name]
      @grade = climbing_route_params[:grade]
      @climbing_route = ClimbingRoute.find(params[:id])
    end

    def call
    end

  private 
    # def calculate_points(grade, style)
    #   #odwołanie do tabeli grades i styles
    # end

    # def climbing_routes_id

    # end



  end
end



# # to nie jest właściwy kod, tylko przykład
#   module ClimbingRouteSerivce
#     class AddClimbingRoute
#       attr_accesor :x, :y, :mountaint

#       def initialize(mountaint_id, params)
#         @x = params[:x]
#         @y = params[:y]
#         @mountain = Mountain.find(mountaint_id)
#       end

#       def call
#         rub_raport_from_this_year! 
#         add_to_last_checkopoint!
#       end

#       private 

#       def run_rapoer_from_this_year!
#         ...
#       end

#       def calculate_last_checkpoint
#         ...
#         ..
#         ...

#         ...
#       end

#       def add_to_last_checkopoint!
#         lc = calculate_last_checkpoint 
#         lc.create!(....)
#       end
#     end
#   end








