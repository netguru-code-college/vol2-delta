class DeleteGradeFromClimbingRoutes < ActiveRecord::Migration[5.1]
  def change
    remove_column :climbing_routes, :grade, :string
  end
end
