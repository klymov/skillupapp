class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :login
      t.string :phone
      t.text   :description

      t.timestamps
    end
  end
end
