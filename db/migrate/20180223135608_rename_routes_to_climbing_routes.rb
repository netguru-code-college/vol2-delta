class RenameRoutesToClimbingRoutes < ActiveRecord::Migration[5.1]
  def change
    remove_reference :routes, :sector, foreign_key: true
    remove_reference :ascents, :route, foreign_key: true

    rename_table :routes, :climbing_routes

    add_reference :ascents, :climbing_route, foreign_key: true
    add_reference :climbing_routes, :sector, foreign_key: true
  end
end
