class AddUserIdToAscent < ActiveRecord::Migration[5.1]
  def change
    add_reference :ascents, :user, foreign_key: true
  end
end
