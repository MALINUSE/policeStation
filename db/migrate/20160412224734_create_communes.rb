class CreateCommunes < ActiveRecord::Migration
  def change
    create_table :communes do |t|
      t.references :cercle, index: true, foreign_key: true
      t.string :name
      t.integer :position

      t.timestamps null: false
    end
  end
end
