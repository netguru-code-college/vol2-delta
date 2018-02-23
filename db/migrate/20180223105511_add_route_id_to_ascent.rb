class AddRouteIdToAscent < ActiveRecord::Migration[5.1]
  def change
    add_reference :ascents, :route, foreign_key: true
  end
end
