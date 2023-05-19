# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_01_154231) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "avatar_url"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "review"
    t.bigint "vehicle_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vehicle_id"], name: "index_reviews_on_vehicle_id"
  end

  create_table "testimonials", force: :cascade do |t|
    t.string "testimonial"
    t.string "author_avatar"
    t.string "author"
    t.string "status"
    t.bigint "admin_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_testimonials_on_admin_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.string "category"
    t.string "transmission"
    t.string "drive"
    t.string "mileage"
    t.bigint "admin_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price"
    t.index ["admin_id"], name: "index_vehicles_on_admin_id"
  end

  add_foreign_key "reviews", "vehicles"
  add_foreign_key "testimonials", "admins"
  add_foreign_key "vehicles", "admins"
end
