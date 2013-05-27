class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string  :brand,           null: false
      t.string  :name,            null: false
      t.string  :car_type,        null: false
      t.integer :engine_volume,   null: false
      t.integer :production_year, null: false, default: 1980

      t.timestamps
    end
  end
end
