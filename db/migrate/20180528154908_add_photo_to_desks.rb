class AddPhotoToDesks < ActiveRecord::Migration[5.2]
  def change
    add_column :desks, :photo, :string
  end
end
