class ChangeClimbingRoutesIdToClimbingRouteIdInAscents < ActiveRecord::Migration[5.1]
  def change
    rename_column :ascents, :climbing_routes_id, :climbing_route_id
  end
end
