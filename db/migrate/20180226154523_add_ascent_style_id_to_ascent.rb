class AddAscentStyleIdToAscent < ActiveRecord::Migration[5.1]
  def change
    add_reference :ascents, :ascent_style, foreign_key: true
  end
end
