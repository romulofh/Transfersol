class CreateAgency < ActiveRecord::Migration[5.0]
  def change
    create_table :agencies do |t|

      t.string :number
      t.string :address
      t.datetime :created_at
      t.datetime :updated_at

    end
  end
end
