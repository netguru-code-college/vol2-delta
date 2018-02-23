class CreateCrags < ActiveRecord::Migration[5.1]
  def change
    create_table :crags do |t|
      t.string :name
      t.string :country
      t.float :x
      t.float :y

      t.timestamps
    end
  end
end
