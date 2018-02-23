class AddSectorIdToRoute < ActiveRecord::Migration[5.1]
  def change
    add_reference :routes, :sector, foreign_key: true
  end
end
