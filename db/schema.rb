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

ActiveRecord::Schema.define(version: 20150213140032) do

  create_table "conferences", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.date     "date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "conference_id"
  end

  add_index "sessions", ["conference_id"], name: "index_sessions_on_conference_id"

  create_table "sessions_speakers", id: false, force: :cascade do |t|
    t.integer "session_id"
    t.integer "speaker_id"
  end

  add_index "sessions_speakers", ["session_id", "speaker_id"], name: "index_sessions_speakers_on_session_id_and_speaker_id"

  create_table "speakers", force: :cascade do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
