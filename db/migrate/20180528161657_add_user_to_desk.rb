class AddUserToDesk < ActiveRecord::Migration[5.2]
  def change
    add_reference :desks, :user, foreign_key: true
  end
end
