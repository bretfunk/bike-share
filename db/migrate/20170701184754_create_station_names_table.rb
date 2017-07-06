class CreateStationNamesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :station_names do |t|
      t.text :name

      t.timestamps null: false
    end
  end
end
