class CreateRoutes < ActiveRecord::Migration[5.1]
  def change
    create_table :routes do |t|
      t.string :name
      t.string :grade
      t.integer :number_of_ascents

      t.timestamps
    end
  end
end
