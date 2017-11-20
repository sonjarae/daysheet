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

ActiveRecord::Schema.define(version: 20171029193732) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "days", force: :cascade do |t|
    t.date "date"
    t.integer "tour_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "other_expenses"
    t.datetime "bus_call_am"
    t.datetime "bus_call_hotel"
    t.string "notes"
    t.decimal "per_diem_exp"
    t.decimal "gas_exp"
    t.decimal "hotel_exp"
    t.string "city"
    t.string "time_zone"
  end

  create_table "incomes", force: :cascade do |t|
    t.decimal "guarantee"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "attendance_paid"
    t.integer "attendance_total"
    t.integer "attendance_comped"
    t.decimal "ticket_price"
    t.decimal "band_end_min"
    t.decimal "band_end_perc"
    t.decimal "band_end_dollar"
    t.decimal "potential_dollar"
    t.decimal "bonus"
    t.string "bonus_notes"
    t.decimal "club_expenses"
    t.string "club_expenses_notes"
    t.decimal "merch_income"
    t.decimal "total_income"
    t.decimal "other_income"
    t.decimal "other_expenses"
    t.string "notes"
    t.integer "schedule_id"
    t.integer "tour_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.datetime "load_in_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "sound_check_time"
    t.datetime "doors_time"
    t.datetime "set_time"
    t.integer "time_between_bands_calc"
    t.string "notes"
    t.string "show_number"
    t.string "show_status"
    t.integer "day_id"
    t.integer "tour_id"
    t.integer "venue_id"
    t.string "guest_list"
    t.integer "income_id"
  end

  create_table "tours", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.text "description"
    t.datetime "available_since"
    t.boolean "active"
    t.binary "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "day_id"
    t.integer "user_id"
    t.integer "income_id"
    t.decimal "per_diem_budget"
    t.decimal "gas_budget"
    t.decimal "hotel_budget"
    t.string "region"
    t.decimal "est_income"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "role"
    t.string "provider"
    t.string "uid"
    t.string "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.string "website"
    t.string "booking_contact"
    t.string "production_contact"
    t.string "sound_contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
