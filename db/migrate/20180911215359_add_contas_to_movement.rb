class AddContasToMovement < ActiveRecord::Migration[5.0]
  def change
    add_column :movements, :conta_raiz, :string
    add_column :movements, :conta_alvo, :string
  end
end
