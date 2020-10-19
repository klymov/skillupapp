class ChangeColmsTypeToOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :passenger
    remove_column :orders, :drive

    add_column :orders, :passenger, :integer
    add_column :orders, :drive, :integer
  end
end
