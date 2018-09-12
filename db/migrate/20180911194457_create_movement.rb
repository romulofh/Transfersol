class CreateMovement < ActiveRecord::Migration[5.0]
  def change
    create_table :movements do |t|
      t.string :type
      t.float :amount
      t.datetime :created_at
    end
  end
end
