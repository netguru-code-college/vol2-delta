class FixColumnName < ActiveRecord::Migration[5.1]
  def change
  	rename_column :route_grades, :Grade, :grade
  end
end
