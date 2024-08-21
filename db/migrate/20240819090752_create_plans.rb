class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.references :user, null: false, foreign_key: true
      t.references :field, null: false, foreign_key: true
      t.references :field_section, null: false, foreign_key: true
      t.references :crop, null: false, foreign_key: true
      t.integer :year, null: false
      t.string :planting_method, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.text :note

      t.timestamps
    end
  end
end
