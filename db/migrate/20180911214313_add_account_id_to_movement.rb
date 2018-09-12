class AddAccountIdToMovement < ActiveRecord::Migration[5.0]
  def change
    add_column :movements, :account_id, :integer
  end
end
