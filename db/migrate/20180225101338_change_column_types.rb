class ChangeColumnTypes < ActiveRecord::Migration[5.1]
  def change
    change_column :crags, :latitude, :decimal
    change_column :crags, :longitude, :decimal
    change_column :sectors, :latitude, :decimal
    change_column :sectors, :longitude, :decimal
  end
end
