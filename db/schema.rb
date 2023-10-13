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

ActiveRecord::Schema[7.0].define(version: 2023_10_13_001917) do
  create_table "benefits", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "benefit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_benefits_on_user_id"
  end

  create_table "emp_details", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "fullname"
    t.integer "emp_id"
    t.string "rank"
    t.string "division"
    t.string "sup_name"
    t.string "pos_title"
    t.integer "ser_year"
    t.integer "ser_month"
    t.string "educ_course"
    t.datetime "educ_grad"
    t.string "educ_skill"
    t.string "educ_certificate"
    t.string "educ_othskill"
    t.string "contact"
    t.string "department"
    t.string "sup_title"
    t.integer "hr_perday"
    t.integer "hr_perweek"
    t.string "break"
    t.string "launch"
    t.boolean "ot_weekday"
    t.boolean "ot_weekend"
    t.integer "workday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_emp_details_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "approve"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "benefits", "users"
  add_foreign_key "emp_details", "users"
end
