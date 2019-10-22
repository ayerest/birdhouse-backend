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

ActiveRecord::Schema.define(version: 2019_10_09_003223) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "badges", force: :cascade do |t|
    t.string "category"
    t.bigint "user_id"
    t.string "medal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_badges_on_user_id"
  end

  create_table "bird_images", force: :cascade do |t|
    t.bigint "bird_id"
    t.bigint "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bird_id"], name: "index_bird_images_on_bird_id"
    t.index ["image_id"], name: "index_bird_images_on_image_id"
  end

  create_table "birds", force: :cascade do |t|
    t.string "common_name"
    t.string "species_name"
    t.string "img_url"
    t.string "range_map"
    t.string "details"
    t.string "category"
    t.string "birdcall"
    t.string "quick_info"
    t.string "img_citation"
    t.string "citation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "field_entries", force: :cascade do |t|
    t.text "notes"
    t.bigint "user_id"
    t.bigint "bird_id"
    t.boolean "share"
    t.boolean "uncertain"
    t.datetime "date"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bird_id"], name: "index_field_entries_on_bird_id"
    t.index ["user_id"], name: "index_field_entries_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.bigint "field_entry_id"
    t.string "img_url"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["field_entry_id"], name: "index_images_on_field_entry_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "avatar"
    t.datetime "last_login"
    t.integer "step_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "badges", "users"
  add_foreign_key "bird_images", "birds"
  add_foreign_key "bird_images", "images"
  add_foreign_key "field_entries", "birds"
  add_foreign_key "field_entries", "users"
  add_foreign_key "images", "field_entries"
end
