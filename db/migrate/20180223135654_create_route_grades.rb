class CreateRouteGrades < ActiveRecord::Migration[5.1]
  def change
    create_table :route_grades do |t|
      t.string :Grade
      t.integer :points

      t.timestamps
    end
  end
end
