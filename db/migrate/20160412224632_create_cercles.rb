class CreateCercles < ActiveRecord::Migration
  def change
    create_table :cercles do |t|
      t.references :region, index: true, foreign_key: true
      t.string :name
      t.integer :position

      t.timestamps null: false
    end
  end
end
