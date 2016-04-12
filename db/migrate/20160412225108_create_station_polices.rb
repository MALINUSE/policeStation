class CreateStationPolices < ActiveRecord::Migration
  def change
    create_table :station_polices do |t|
      t.string :name
      t.string :address
      t.references :commune, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
