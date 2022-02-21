class AddUserToPet < ActiveRecord::Migration[6.1]
  def change
    add_reference :pets, :user, null: false, foreign_key: true
  end
end
