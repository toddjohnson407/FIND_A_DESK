class RemoveDeskFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_reference :users, :desk, foreign_key: true
  end
end
