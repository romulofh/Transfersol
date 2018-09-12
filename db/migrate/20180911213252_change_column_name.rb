class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :movements, :type, :movement_type
  end
end
