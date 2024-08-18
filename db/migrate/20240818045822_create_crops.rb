class CreateCrops < ActiveRecord::Migration[6.1]
  def change
    create_table :crops do |t|
      t.string :name, null: false
      t.string :plant_family, null: false
      t.string :rotation_year, null: false
      t.string :companion
      t.text :note

      t.timestamps
    end
  end
end
