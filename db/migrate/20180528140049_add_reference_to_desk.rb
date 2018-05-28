class AddReferenceToDesk < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :desk, foreign_key: true
  end
end
