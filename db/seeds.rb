require 'csv'
require 'pry'
require 'Date'
require 'active_support/core_ext/time'
require './app/models/city'
require './app/models/station_name'
require './app/models/bike_share_date'
require './app/models/station'
require './app/models/subscription_type'
require './app/models/zip_code'
require './app/models/trip'
require './app/models/weather'

Weather.destroy_all
City.destroy_all
StationName.destroy_all
BikeShareDate.destroy_all
Station.destroy_all
Trip.destroy_all
SubscriptionType.destroy_all
ZipCode.destroy_all


station_text = File.read('./db/csv/station.csv')
station_csv = CSV.parse(station_text, :headers => true, header_converters: :symbol)
station_csv.each do |row|
  station_name      = StationName.find_or_initialize_by(name: row[:name])
  date              = DateTime.strptime(row[:installation_date], '%m/%d/%Y')
  installation_date = BikeShareDate.find_or_initialize_by(bike_share_date: date)
  city              = City.find_or_create_by!(name: row[:city])
  Station.create!(station_id:    row[:id],
                station_name:    station_name,
                lat:             row[:lat],
                long:            row[:long],
                dock_count:      row[:dock_count],
                city:            city,
                bike_share_date: installation_date)
end

x = Time.now
counter = 1

trip_text = File.read('./db/csv/trip.csv')
trip_csv = CSV.parse(trip_text, :headers => true, header_converters: :symbol)
trip_csv.each do |row|
  Trip.transaction do
    prelim_start_date = DateTime.strptime(row[:start_date], '%m/%d/%Y %H:%M')
    start_date_entry  = BikeShareDate.find_or_initialize_by(bike_share_date: prelim_start_date)
    ss_name_entry     = StationName.find_or_initialize_by(name: row[:start_station_name])
    ss_id_entry       = Station.find_by(station_id: row[:start_station_id])
    prelim_end_date   = DateTime.strptime(row[:end_date], '%m/%d/%Y %H:%M')
    end_date_entry    = BikeShareDate.find_or_initialize_by(bike_share_date: prelim_end_date)
    es_name_entry     = StationName.find_or_initialize_by(name: row[:end_station_name])
    es_id_entry       = Station.find_by(station_id: row[:end_station_id])
    e_sub_type        = SubscriptionType.find_or_initialize_by(name: row[:subscription_type])
    entry_zip         = ZipCode.find_or_initialize_by(zip_code: row[:zip_code])
    Trip.create!(           trip_id:               row[:id],
                            duration:              row[:duration],
                            start_bike_share_date: start_date_entry,
                            start_station_name:    ss_name_entry,
                            start_station:         ss_id_entry,
                            end_bike_share_date:   end_date_entry,
                            end_station_name:      es_name_entry,
                            end_station:           es_id_entry,
                            bike_id:               row[:bike_id],
                            subscription_type:     e_sub_type,
                            zip_code:              entry_zip)
  end
  puts counter
  counter += 1
end

y = Time.now

weather_text = File.read('./db/csv/weather.csv')
weather_csv = CSV.parse(weather_text, :headers => true, header_converters: :symbol)
weather_csv.each do |row|
  Weather.transaction do
    date_str = DateTime.strptime(row[:date], '%m/%d/%Y')
    date = BikeShareDate.find_or_initialize_by(bike_share_date: date_str)
    max_temp = row[:max_temperature_f]
    mean_temp = row[:mean_temperature_f]
    min_temp = row[:min_temperature_f]
    max_dew_point_f = row[:max_dew_point_f]
    mean_dew_point_f = row[:mean_dew_point_f]
    min_dew_point_f = row[:min_dew_point_f]
    max_humidity = row[:max_humidity]
    mean_humidity = row[:mean_humidity]
    min_humidity = row[:min_humidity]
    max_sea_level_pressure_inches  = row[:max_sea_level_pressure_inches]
    mean_sea_level_pressure_inches = row[:mean_sea_level_pressure_inches]
    min_sea_level_pressure_inches  = row[:min_sea_level_pressure_inches]
    max_visibility_miles = row[:max_visibility_miles]
    mean_visibility_miles = row[:mean_visibility_miles]
    min_visibility_miles = row[:min_visibility_miles]
    max_wind_speed_mph = row[:max_wind_speed_mph]
    mean_wind_speed_mph = row[:mean_wind_speed_mph]
    max_gust_speed_mph = row[:max_gust_speed_mph]
    precipitation_inches = row[:precipitation_inches]
    cloud_cover = row[:cloud_cover]
    events = row[:events]
    wind_dir_degrees = row[:wind_dir_degrees]
    zip_code = ZipCode.find_or_initialize_by(zip_code: row[:zip_code])

    Weather.create!(bike_share_date: date,
                    max_temperature_f: max_temp,
                    mean_temperature_f: mean_temp,
                    min_temperature_f: min_temp,
                    max_dew_point_f: max_dew_point_f,
                    mean_dew_point_f: mean_dew_point_f,
                    min_dew_point_f: min_dew_point_f,
                    max_humidity: max_humidity,
                    mean_humidity: mean_humidity,
                    min_humidity: min_humidity,
                    max_sea_level_pressure_inches: max_sea_level_pressure_inches,
                    mean_sea_level_pressure_inches: mean_sea_level_pressure_inches,
                    min_sea_level_pressure_inches: min_sea_level_pressure_inches,
                    max_visibility_miles: max_visibility_miles,
                    mean_visibility_miles: mean_visibility_miles,
                    min_visibility_miles: min_visibility_miles,
                    max_wind_speed_mph: max_wind_speed_mph,
                    mean_wind_speed_mph: mean_wind_speed_mph,
                    max_gust_speed_mph: max_gust_speed_mph,
                    precipitation_inches: precipitation_inches,
                    cloud_cover: cloud_cover,
                    events: events,
                    wind_dir_degrees: wind_dir_degrees,
                    zip_code: zip_code
                    )
                  end
 end

puts y - x
