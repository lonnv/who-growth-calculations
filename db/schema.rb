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

ActiveRecord::Schema.define(version: 20161130115736) do

  create_table "charts", force: :cascade do |t|
    t.date     "birth_day"
    t.boolean  "male"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lms_refs", force: :cascade do |t|
    t.boolean  "male"
    t.boolean  "time_in_months"
    t.integer  "time_amount"
    t.float    "l"
    t.float    "m"
    t.float    "s"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "measurements", force: :cascade do |t|
    t.date     "date"
    t.float    "weight"
    t.integer  "length"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "chart_id"
    t.index ["chart_id"], name: "index_measurements_on_chart_id"
  end

end
