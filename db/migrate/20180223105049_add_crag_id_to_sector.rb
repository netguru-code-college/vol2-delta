class AddCragIdToSector < ActiveRecord::Migration[5.1]
  def change
    add_reference :sectors, :crag, foreign_key: true
  end
end
