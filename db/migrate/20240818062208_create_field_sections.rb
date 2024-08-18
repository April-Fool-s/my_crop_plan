class CreateFieldSections < ActiveRecord::Migration[6.1]
  def change
    create_table :field_sections do |t|
      t.references :field, null: false, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
