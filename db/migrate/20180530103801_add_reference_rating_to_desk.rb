class AddReferenceRatingToDesk < ActiveRecord::Migration[5.2]
  def change
    add_reference :desks, :rate, foreign_key: true
  end
end
