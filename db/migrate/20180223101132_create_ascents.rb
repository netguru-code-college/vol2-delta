class CreateAscents < ActiveRecord::Migration[5.1]
  def change
    create_table :ascents do |t|
      t.string :grade
      t.text :comment
      t.timestamp :date
      t.string :style
      t.integer :points

      t.timestamps
    end
  end
end
