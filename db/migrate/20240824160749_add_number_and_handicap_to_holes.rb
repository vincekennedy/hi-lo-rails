class AddNumberAndHandicapToHoles < ActiveRecord::Migration[7.1]
  def change
    add_column :holes, :number, :integer
    add_column :holes, :handicap, :integer
  end
end
