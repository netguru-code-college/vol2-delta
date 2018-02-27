class DeleteGradeFromAscent < ActiveRecord::Migration[5.1]
  def change
    remove_column :ascents, :grade, :string
  end
end
