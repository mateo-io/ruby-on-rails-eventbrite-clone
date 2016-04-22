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

ActiveRecord::Schema.define(version: 20160422194239) do

  create_table "events", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "date"
    t.text     "description"
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id"

  create_table "goings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "goings", ["event_id"], name: "index_goings_on_event_id"
  add_index "goings", ["user_id"], name: "index_goings_on_user_id"

  create_table "invitations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.integer "inviter"
    t.integer "show",     default: 1
  end

  add_index "invitations", ["event_id"], name: "index_invitations_on_event_id"
  add_index "invitations", ["user_id"], name: "index_invitations_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
