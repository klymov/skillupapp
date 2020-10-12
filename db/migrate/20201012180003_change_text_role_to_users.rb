class ChangeTextRoleToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :role, :text
  end
end
