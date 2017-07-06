class CreateStations < ActiveRecord::Migration[5.0]
  def change
    create_table :stations do |t|
      t.integer :station_id
      t.integer :station_name_id
      t.decimal :lat
      t.decimal :long
      t.integer :dock_count
      t.integer :city_id
      t.integer :installation_date_id

      t.timestamps null: false
    end
  end
end
