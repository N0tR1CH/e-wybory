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

ActiveRecord::Schema[7.1].define(version: 2024_06_04_200229) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "election_groups", force: :cascade do |t|
    t.bigint "election_id", null: false
    t.bigint "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["election_id"], name: "index_election_groups_on_election_id"
    t.index ["group_id"], name: "index_election_groups_on_group_id"
  end

  create_table "election_sheet_candidates", force: :cascade do |t|
    t.string "name"
    t.bigint "votes", default: 0, null: false
    t.bigint "election_sheet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["election_sheet_id"], name: "index_election_sheet_candidates_on_election_sheet_id"
  end

  create_table "election_sheet_user_votes", primary_key: ["election_sheet_id", "user_id"], force: :cascade do |t|
    t.bigint "election_sheet_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["election_sheet_id"], name: "index_election_sheet_user_votes_on_election_sheet_id"
    t.index ["user_id"], name: "index_election_sheet_user_votes_on_user_id"
  end

  create_table "election_sheets", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "max_votes_per_user"
    t.integer "max_votes_per_candidate"
    t.boolean "requires_all_votes_spent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "election_id", null: false
    t.index ["election_id"], name: "index_election_sheets_on_election_id"
  end

  create_table "elections", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "date_from"
    t.datetime "date_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.json "permissions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_groups", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_user_groups_on_group_id"
    t.index ["user_id"], name: "index_user_groups_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "role_id", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "election_groups", "elections"
  add_foreign_key "election_groups", "groups"
  add_foreign_key "election_sheet_candidates", "election_sheets"
  add_foreign_key "election_sheet_user_votes", "election_sheets"
  add_foreign_key "election_sheet_user_votes", "users"
  add_foreign_key "election_sheets", "elections"
  add_foreign_key "user_groups", "groups"
  add_foreign_key "user_groups", "users"
  add_foreign_key "users", "roles"
end
