class RenamePetsInReservations < ActiveRecord::Migration[6.1]
  def change
    rename_column :reservations, :pets_id, :pet_id
  end
end
