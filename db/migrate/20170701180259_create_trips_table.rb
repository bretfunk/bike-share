class CreateTripsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.integer :trip_id
      t.integer :duration
      t.integer :start_date_id
      t.integer :start_station_name_id
      t.integer :start_station_id
      t.integer :end_date_id
      t.integer :end_station_name_id
      t.integer :end_station_id
      t.integer :bike_id
      t.integer :subscription_type_id
      t.integer :zip_code_id
      
      t.timestamps null: false
    end
  end
end
