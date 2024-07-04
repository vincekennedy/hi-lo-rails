class CreateHoles < ActiveRecord::Migration[7.1]
  def change
    create_table :holes do |t|
      t.integer :course_id
      t.integer :hole_number
      t.integer :hole_handicap
      t.integer :hole_par

      t.timestamps
    end
  end
end
