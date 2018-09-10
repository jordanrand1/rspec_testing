class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.integer :age
      t.float :price
      t.integer :mileage
      t.string :color
      t.string :interior

      t.timestamps
    end
  end
end
