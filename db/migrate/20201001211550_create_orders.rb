class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :passenger_id
      t.integer :driver_id
      t.integer :status, default: 0 # enums [new: 0, assigned: 1, in_progess: 2, completed:3]
      t.text :description

      t.timestamps
    end
  end
end
