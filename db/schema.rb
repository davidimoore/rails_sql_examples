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

ActiveRecord::Schema.define(version: 20160213222859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.text     "title"
    t.text     "artist"
    t.text     "label"
    t.text     "released"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", force: :cascade do |t|
    t.text     "name"
    t.text     "country_code"
    t.text     "district"
    t.text     "population"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "post_id"
    t.string   "body"
    t.datetime "created_at", default: '2016-02-12 19:23:05'
    t.datetime "updated_at", default: '2016-02-12 19:23:05'
  end

  create_table "countries", force: :cascade do |t|
    t.text     "code"
    t.text     "name"
    t.text     "continent"
    t.text     "region"
    t.float    "surface_area"
    t.integer  "indep_year"
    t.integer  "population"
    t.float    "life_expectancy"
    t.float    "gnp"
    t.float    "gnp_old"
    t.text     "local_name"
    t.text     "government_form"
    t.text     "head_of_state"
    t.integer  "capital"
    t.text     "code_2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "country_languages", force: :cascade do |t|
    t.text     "country_code"
    t.text     "language"
    t.integer  "is_official"
    t.float    "percentage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: :cascade do |t|
    t.text     "name"
    t.text     "address"
    t.text     "city"
    t.text     "state"
    t.text     "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: :cascade do |t|
    t.text     "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "body"
    t.datetime "created_at", default: '2016-02-12 19:23:05'
    t.datetime "updated_at", default: '2016-02-12 19:23:05'
  end

  create_table "sales", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "customer_id"
    t.date     "date"
    t.integer  "quantity"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tracks", force: :cascade do |t|
    t.integer  "album_id"
    t.text     "title"
    t.integer  "track_number"
    t.integer  "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "two_player_scores", force: :cascade do |t|
    t.integer  "player_1"
    t.integer  "player_2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
