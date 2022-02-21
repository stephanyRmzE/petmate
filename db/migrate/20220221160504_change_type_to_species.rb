class ChangeTypeToSpecies < ActiveRecord::Migration[6.1]
  def change
    rename_column :pets, :type, :species
  end
end
