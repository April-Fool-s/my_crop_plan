class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.references :user, null: false, foreign_key: true
      t.references :field, null: false, foreign_key: true
      t.references :field_section, null: false, foreign_key: true
      t.integer :year, null: false
      t.boolean :is_active, null: false, default: true

      t.timestamps
    end
  end
end
