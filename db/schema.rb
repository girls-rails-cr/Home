# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180203044419) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "event_attachments", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.string "img"
    t.string "attach"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_attachments_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title", null: false
    t.string "description"
    t.text "venue_description"
    t.datetime "start_time"
    t.string "video_url"
    t.string "venue_short_description"
    t.string "map_url"
    t.string "background_image"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "end_date"
    t.string "venue_name"
    t.string "venue_address"
    t.text "short_description"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "avatar"
    t.string "username"
    t.string "career"
    t.string "address"
    t.string "fb_link"
    t.string "twitter_link"
    t.string "linkedin"
    t.text "about_me"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "schedule_details", force: :cascade do |t|
    t.bigint "schedule_id", null: false
    t.string "name"
    t.time "date_name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["schedule_id"], name: "index_schedule_details_on_schedule_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_schedules_on_event_id"
  end

  create_table "sponsors", force: :cascade do |t|
    t.string "name"
    t.string "email_contact"
    t.text "description"
    t.string "company"
    t.string "logo"
    t.string "page_url"
    t.integer "event_id"
    t.integer "status", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscribers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "second_confirmed"
    t.string "comments"
    t.string "work"
    t.integer "event_id"
    t.boolean "registered"
    t.boolean "confirmed"
    t.integer "level_knowledge"
    t.string "phone_number"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "role", default: 0, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "event_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "voluntaries", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "career"
    t.string "interest_area"
    t.string "email"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "event_id"
  end

  add_foreign_key "event_attachments", "events", on_delete: :cascade
  add_foreign_key "profiles", "users", on_delete: :cascade
  add_foreign_key "schedule_details", "schedules", on_delete: :cascade
  add_foreign_key "schedules", "events", on_delete: :cascade
end
