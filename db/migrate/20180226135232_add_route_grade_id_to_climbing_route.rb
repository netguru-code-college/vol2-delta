class AddRouteGradeIdToClimbingRoute < ActiveRecord::Migration[5.1]
  def change
    add_reference :climbing_routes, :route_grade, foreign_key: true
  end
end
