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

ActiveRecord::Schema.define(version: 20180226154803) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ascent_styles", force: :cascade do |t|
    t.string "style"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ascents", force: :cascade do |t|
    t.string "grade"
    t.text "comment"
    t.datetime "date"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "climbing_routes_id"
    t.bigint "ascent_style_id"
    t.index ["ascent_style_id"], name: "index_ascents_on_ascent_style_id"
    t.index ["climbing_routes_id"], name: "index_ascents_on_climbing_routes_id"
    t.index ["user_id"], name: "index_ascents_on_user_id"
  end

  create_table "climbing_routes", force: :cascade do |t|
    t.string "name"
    t.integer "number_of_ascents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "sector_id"
    t.bigint "route_grade_id"
    t.index ["route_grade_id"], name: "index_climbing_routes_on_route_grade_id"
    t.index ["sector_id"], name: "index_climbing_routes_on_sector_id"
  end

  create_table "crags", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.decimal "latitude"
    t.decimal "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "route_grades", force: :cascade do |t|
    t.string "grade"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sectors", force: :cascade do |t|
    t.string "name"
    t.string "aspect"
    t.decimal "latitude"
    t.decimal "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "crag_id"
    t.index ["crag_id"], name: "index_sectors_on_crag_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "ascents", "ascent_styles"
  add_foreign_key "ascents", "climbing_routes", column: "climbing_routes_id"
  add_foreign_key "ascents", "users"
  add_foreign_key "climbing_routes", "route_grades"
  add_foreign_key "climbing_routes", "sectors"
  add_foreign_key "sectors", "crags"
end
