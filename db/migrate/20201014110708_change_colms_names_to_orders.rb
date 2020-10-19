class ChangeColmsNamesToOrders < ActiveRecord::Migration[6.0]
  def change
    rename_column :orders, :login, :passenger
    rename_column :orders, :phone, :drive
  end
end
