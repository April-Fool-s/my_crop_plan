class CreateFields < ActiveRecord::Migration[6.1]
  def change
    create_table :fields do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.string :address
      t.string :area

      t.timestamps
    end
  end
end
