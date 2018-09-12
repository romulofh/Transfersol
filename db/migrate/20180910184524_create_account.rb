class CreateAccount < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|

      t.string :number
      t.float :limit

    end
  end
end
