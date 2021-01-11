class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.integer :role, default: 0
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
