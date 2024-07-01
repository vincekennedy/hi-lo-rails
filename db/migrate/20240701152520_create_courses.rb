class CreateCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.float :rating
      t.integer :slope
      t.integer :par

      t.timestamps
    end
  end
end
