class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string  :maker
      t.string  :model
      t.integer :number
      t.string  :color
      t.date    :production_date
      t.string  :body_type

      t.timestamps
    end
  end
end
