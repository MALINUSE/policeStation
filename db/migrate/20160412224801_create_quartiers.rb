class CreateQuartiers < ActiveRecord::Migration
  def change
    create_table :quartiers do |t|
      t.references :commune, index: true, foreign_key: true
      t.string :name
      t.integer :position

      t.timestamps null: false
    end
  end
end
