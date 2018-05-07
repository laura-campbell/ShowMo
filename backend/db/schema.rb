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

ActiveRecord::Schema.define(version: 20180507180012) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attends", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "show_id"
    t.float "rating"
    t.boolean "checkin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["show_id"], name: "index_attends_on_show_id"
    t.index ["user_id"], name: "index_attends_on_user_id"
  end

  create_table "fans", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_fans_on_artist_id"
    t.index ["user_id"], name: "index_fans_on_user_id"
  end

  create_table "setlists", force: :cascade do |t|
    t.text "content"
    t.bigint "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_setlists_on_artist_id"
  end

  create_table "shows", force: :cascade do |t|
    t.bigint "artist_id"
    t.bigint "venue_id"
    t.datetime "showtime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_shows_on_artist_id"
    t.index ["venue_id"], name: "index_shows_on_venue_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "phone"
    t.string "email"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "attends", "shows"
  add_foreign_key "attends", "users"
  add_foreign_key "fans", "artists"
  add_foreign_key "fans", "users"
  add_foreign_key "setlists", "artists"
  add_foreign_key "shows", "artists"
  add_foreign_key "shows", "venues"
end
