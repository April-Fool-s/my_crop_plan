class CreatePlanCrops < ActiveRecord::Migration[6.1]
  def change
    create_table :plan_crops do |t|
      t.references :plan, null: false, foreign_key: true
      t.references :crop, null: false, foreign_key: true
      t.string :planting_method, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.text :note

      t.timestamps
    end
  end
end
