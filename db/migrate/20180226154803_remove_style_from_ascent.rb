class RemoveStyleFromAscent < ActiveRecord::Migration[5.1]
  def change
    remove_column :ascents, :style, :string
  end
end
