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

ActiveRecord::Schema.define(version: 20150825031909) do

  create_table "event_users", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "ev_id",      limit: 4
    t.string   "summary",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_users", ["user_id", "ev_id"], name: "index_event_users_on_user_id_and_ev_id", using: :btree

  create_table "evs", force: :cascade do |t|
    t.string   "name",        limit: 100
    t.integer  "date",        limit: 4
    t.string   "description", limit: 255, default: "", null: false
    t.string   "location",    limit: 100
    t.string   "username",    limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "the_events", force: :cascade do |t|
    t.string   "name",        limit: 100
    t.integer  "date",        limit: 4
    t.string   "description", limit: 255, default: "", null: false
    t.string   "location",    limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",   limit: 50
    t.string   "email",      limit: 255, default: "", null: false
    t.string   "password",   limit: 40
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users_events", id: false, force: :cascade do |t|
    t.integer "user_id", limit: 4
    t.integer "ev_id",   limit: 4
  end

  add_index "users_events", ["user_id", "ev_id"], name: "index_users_events_on_user_id_and_ev_id", using: :btree

end
