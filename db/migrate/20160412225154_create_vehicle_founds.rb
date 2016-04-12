class CreateVehicleFounds < ActiveRecord::Migration
  def change
    create_table :vehicle_founds do |t|
      t.references :station_police, index: true, foreign_key: true
      t.references :engin, index: true, foreign_key: true
      t.string :color
      t.text :description

      t.timestamps null: false
    end
  end
end
