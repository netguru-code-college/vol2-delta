class ChangeColumnNames < ActiveRecord::Migration[5.1]
  def change
    rename_column :crags, :x, :latitude
    rename_column :crags, :y, :longitude

    rename_column :sectors, :x, :latitude
    rename_column :sectors, :y, :longitude
  end
end
