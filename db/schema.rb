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

ActiveRecord::Schema.define(version: 20150715172109) do

  create_table "locations", force: :cascade do |t|
    t.float    "lat"
    t.float    "lon"
    t.string   "User_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "address"
  end

  add_index "locations", ["User_id"], name: "index_locations_on_User_id"

  create_table "meters", force: :cascade do |t|
    t.integer  "nameId"
    t.string   "meterHeadType"
    t.integer  "timeLimit"
    t.float    "rate"
    t.integer  "payByPhoneNumber"
    t.float    "lat"
    t.float    "lon"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "timeInEffect"
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "token"
    t.string   "secret"
    t.string   "profile_image"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
