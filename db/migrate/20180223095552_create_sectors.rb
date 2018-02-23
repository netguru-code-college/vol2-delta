class CreateSectors < ActiveRecord::Migration[5.1]
  def change
    create_table :sectors do |t|
      t.string :name
      t.string :aspect
      t.float :x
      t.float :y

      t.timestamps
    end
  end
end
