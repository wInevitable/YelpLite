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

ActiveRecord::Schema.define(version: 20140707001910) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "businesses", force: true do |t|
    t.string   "name",                default: "",    null: false
    t.string   "address",             default: "",    null: false
    t.string   "city_state_zip",      default: "",    null: false
    t.string   "country"
    t.string   "phone_number"
    t.string   "website_url"
    t.integer  "owner_id",                            null: false
    t.boolean  "recent",              default: false, null: false
    t.integer  "rating",              default: 0
    t.integer  "num_ratings",         default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.float    "lat"
    t.float    "long"
    t.string   "display_address"
  end

  add_index "businesses", ["city_state_zip"], name: "index_businesses_on_city_state_zip", using: :btree
  add_index "businesses", ["lat", "long"], name: "index_businesses_on_lat_and_long", using: :btree
  add_index "businesses", ["name"], name: "index_businesses_on_name", using: :btree

  create_table "pg_search_documents", force: true do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.text     "content",     null: false
    t.integer  "rating",      null: false
    t.integer  "author_id",   null: false
    t.integer  "business_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["author_id", "business_id"], name: "index_reviews_on_author_id_and_business_id", using: :btree

  create_table "sessions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "session_token",       null: false
    t.string   "fname"
    t.string   "lname"
    t.string   "nickname"
    t.string   "location"
    t.text     "things_i_love"
    t.string   "hometown"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "login_type"
    t.float    "lat"
    t.float    "long"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree

end
