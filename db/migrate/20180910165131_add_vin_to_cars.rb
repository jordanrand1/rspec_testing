class AddVinToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :vin, :string
  end
end
