class AddAgencyIdToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :agency_id, :integer
  end
end
