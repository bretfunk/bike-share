class UpdateDateColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :bike_share_dates, :date, :bike_share_date
  end
end
