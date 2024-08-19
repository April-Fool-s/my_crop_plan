# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2024_08_19_090752) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "crops", force: :cascade do |t|
    t.string "name", null: false
    t.string "plant_family", null: false
    t.string "rotation_year", null: false
    t.string "companion"
    t.text "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "field_sections", force: :cascade do |t|
    t.integer "field_id", null: false
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["field_id"], name: "index_field_sections_on_field_id"
  end

  create_table "fields", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name", null: false
    t.string "address"
    t.string "area"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_fields_on_user_id"
  end

  create_table "plans", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "field_id", null: false
    t.integer "field_section_id", null: false
    t.integer "crop_id", null: false
    t.integer "year", null: false
    t.string "title"
    t.string "planting_method", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.text "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["crop_id"], name: "index_plans_on_crop_id"
    t.index ["field_id"], name: "index_plans_on_field_id"
    t.index ["field_section_id"], name: "index_plans_on_field_section_id"
    t.index ["user_id"], name: "index_plans_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "is_active", default: true, null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "field_sections", "fields"
  add_foreign_key "fields", "users"
  add_foreign_key "plans", "crops"
  add_foreign_key "plans", "field_sections"
  add_foreign_key "plans", "fields"
  add_foreign_key "plans", "users"
end
