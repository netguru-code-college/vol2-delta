class CreateAscentStyles < ActiveRecord::Migration[5.1]
  def change
    create_table :ascent_styles do |t|
      t.string :style
      t.integer :points

      t.timestamps
    end
  end
end
