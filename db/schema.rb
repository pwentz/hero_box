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

ActiveRecord::Schema.define(version: 20160723185816) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hero_powers", force: :cascade do |t|
    t.integer "hero_id"
    t.integer "power_id"
  end

  add_index "hero_powers", ["hero_id"], name: "index_hero_powers_on_hero_id", using: :btree
  add_index "hero_powers", ["power_id"], name: "index_hero_powers_on_power_id", using: :btree

  create_table "heros", force: :cascade do |t|
    t.string  "name"
    t.string  "hometown"
    t.string  "password_digest"
    t.integer "role"
    t.string  "image_url"
  end

  create_table "powers", force: :cascade do |t|
    t.string "name"
    t.string "cost"
  end

  create_table "stopped_crimes", force: :cascade do |t|
    t.string   "potential_victim"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "hero_id"
    t.string   "crime"
    t.string   "criminal"
    t.integer  "role"
  end

  add_index "stopped_crimes", ["hero_id"], name: "index_stopped_crimes_on_hero_id", using: :btree

  add_foreign_key "hero_powers", "heros"
  add_foreign_key "hero_powers", "powers"
  add_foreign_key "stopped_crimes", "heros"
end
