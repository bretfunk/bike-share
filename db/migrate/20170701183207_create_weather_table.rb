class CreateWeatherTable < ActiveRecord::Migration[5.0]
  def change
    create_table :weathers do |t|
      t.integer :date_id
      t.decimal :max_temperature_f
      t.decimal :mean_temperature_f
      t.decimal :min_temperature_f
      t.decimal :max_dew_point_f
      t.decimal :mean_dew_point_f
      t.decimal :min_dew_point_f
      t.decimal :max_humidity
      t.decimal :mean_humidity
      t.decimal :min_humidity
      t.decimal :max_sea_level_pressure_inches
      t.decimal :mean_sea_level_pressure_inches
      t.decimal :min_sea_level_pressure_inches
      t.decimal :max_visibility_miles
      t.decimal :mean_visibility_miles
      t.decimal :min_visibility_miles
      t.decimal :max_wind_speed_mph
      t.decimal :mean_wind_speed_mph
      t.decimal :max_gust_speed_mph
      t.decimal :precipitation_inches
      t.decimal :cloud_cover
      t.decimal :events
      t.decimal :wind_dir_degrees
      t.integer :zip_code_id

      t.timestamps null: false
    end
  end
end
