class AddAgenciaToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :agencia, :string
  end
end
