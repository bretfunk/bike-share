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

ActiveRecord::Schema.define(version: 20170702210245) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bike_share_dates", force: :cascade do |t|
    t.datetime "bike_share_date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "cities", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "station_names", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stations", force: :cascade do |t|
    t.integer  "station_id"
    t.integer  "station_name_id"
    t.decimal  "lat"
    t.decimal  "long"
    t.integer  "dock_count"
    t.integer  "city_id"
    t.integer  "installation_date_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "subscription_types", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.integer  "trip_id"
    t.integer  "duration"
    t.integer  "start_date_id"
    t.integer  "start_station_name_id"
    t.integer  "start_station_id"
    t.integer  "end_date_id"
    t.integer  "end_station_name_id"
    t.integer  "end_station_id"
    t.integer  "bike_id"
    t.integer  "subscription_type_id"
    t.integer  "zip_code_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "weathers", force: :cascade do |t|
    t.integer  "date_id"
    t.decimal  "max_temperature_f"
    t.decimal  "mean_temperature_f"
    t.decimal  "min_temperature_f"
    t.decimal  "max_dew_point_f"
    t.decimal  "mean_dew_point_f"
    t.decimal  "min_dew_point_f"
    t.decimal  "max_humidity"
    t.decimal  "mean_humidity"
    t.decimal  "min_humidity"
    t.decimal  "max_sea_level_pressure_inches"
    t.decimal  "mean_sea_level_pressure_inches"
    t.decimal  "min_sea_level_pressure_inches"
    t.decimal  "max_visibility_miles"
    t.decimal  "mean_visibility_miles"
    t.decimal  "min_visibility_miles"
    t.decimal  "max_wind_speed_mph"
    t.decimal  "mean_wind_speed_mph"
    t.decimal  "max_gust_speed_mph"
    t.decimal  "precipitation_inches"
    t.decimal  "cloud_cover"
    t.decimal  "events"
    t.decimal  "wind_dir_degrees"
    t.integer  "zip_code_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "zip_codes", force: :cascade do |t|
    t.bigint   "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
