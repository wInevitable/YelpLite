# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140625193801) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "businesses", force: true do |t|
    t.string   "name",           default: "",    null: false
    t.string   "address"
    t.string   "city_state_zip", default: "",    null: false
    t.string   "country"
    t.string   "phone_number"
    t.string   "website_url"
    t.integer  "owner_id",                       null: false
    t.boolean  "recent",         default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "businesses", ["city_state_zip"], name: "index_businesses_on_city_state_zip", using: :btree
  add_index "businesses", ["name", "city_state_zip"], name: "index_businesses_on_name_and_city_state_zip", unique: true, using: :btree
  add_index "businesses", ["name"], name: "index_businesses_on_name", using: :btree

  create_table "sessions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.string   "session_token",      default: "", null: false
    t.string   "fname",              default: "", null: false
    t.string   "lname",              default: "", null: false
    t.string   "nickname"
    t.string   "location"
    t.text     "things_i_love"
    t.string   "hometown"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree

end