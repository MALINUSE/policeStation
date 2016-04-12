class CreateDeclarations < ActiveRecord::Migration
  def change
    create_table :declarations do |t|
      t.references :user, index: true, foreign_key: true
      t.references :quartier, index: true, foreign_key: true
      t.references :engin, index: true, foreign_key: true
      t.string :color
      t.text :description

      t.timestamps null: false
    end
  end
end
