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

ActiveRecord::Schema[7.1].define(version: 2024_08_01_040954) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.bigint "manager_id", null: false
    t.bigint "report_id", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manager_id"], name: "index_events_on_manager_id"
    t.index ["report_id"], name: "index_events_on_report_id"
  end

  create_table "managers", force: :cascade do |t|
    t.string "name"
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_managers_on_company_id"
  end

  create_table "notes", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.integer "manager_id"
    t.integer "report_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_notes_on_event_id"
  end

  create_table "reports", force: :cascade do |t|
    t.string "name"
    t.bigint "company_id", null: false
    t.bigint "manager_id", null: false
    t.integer "preferred_day"
    t.integer "preferred_hour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_reports_on_company_id"
    t.index ["manager_id"], name: "index_reports_on_manager_id"
  end

  add_foreign_key "events", "managers"
  add_foreign_key "events", "reports"
  add_foreign_key "managers", "companies"
  add_foreign_key "notes", "events"
  add_foreign_key "reports", "companies"
  add_foreign_key "reports", "managers"
end
