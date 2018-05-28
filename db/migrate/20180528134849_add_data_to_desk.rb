class AddDataToDesk < ActiveRecord::Migration[5.2]
  def change
    add_column :desks, :name, :string
    add_column :desks, :price, :integer
    add_column :desks, :description, :text
    add_column :desks, :address, :string
    add_column :desks, :rating, :integer
  end
end
