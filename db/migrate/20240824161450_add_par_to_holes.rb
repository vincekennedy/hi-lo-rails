class AddParToHoles < ActiveRecord::Migration[7.1]
  def change
    add_column :holes, :par, :integer
  end
end
