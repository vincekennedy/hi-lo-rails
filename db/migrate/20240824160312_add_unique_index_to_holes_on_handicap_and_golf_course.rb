class AddUniqueIndexToHolesOnHandicapAndGolfCourse < ActiveRecord::Migration[7.1]
  def change
    add_index :holes, [:course_id], unique: false
  end
end
