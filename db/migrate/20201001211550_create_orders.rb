class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :passenger_id
      t.integer :driver_id
      t.integer :status, default: 0
      t.text :description

      t.timestamps
    end
  end
end
