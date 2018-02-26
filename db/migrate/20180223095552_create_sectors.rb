class CreateSectors < ActiveRecord::Migration[5.1]
  def change
    create_table :sectors do |t|
      t.string :name
      t.string :aspect
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
