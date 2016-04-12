class CreateEngins < ActiveRecord::Migration
  def change
    create_table :engins do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
