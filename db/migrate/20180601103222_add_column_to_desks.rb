class AddColumnToDesks < ActiveRecord::Migration[5.2]
  def change
    add_column :desks, :capacity, :integer
  end
end
