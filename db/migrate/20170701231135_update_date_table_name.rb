class UpdateDateTableName < ActiveRecord::Migration[5.0]
  def change
    rename_table :dates, :bike_share_dates
  end
end
