class ExtendZipCodeColumnToEight < ActiveRecord::Migration[5.0]
  def change
    change_column :zip_codes, :zip_code, :integer, limit: 8
  end
end
