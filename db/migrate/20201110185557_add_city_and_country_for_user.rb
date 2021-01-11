class AddCityAndCountryForUser < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|
      t.string :country, :code
      t.timestamps
    end

    create_table :cities do |t|
      t.belongs_to :country
      t.string :city
      t.timestamps
    end

    add_column :users, :city_id, :integer
  end
end
