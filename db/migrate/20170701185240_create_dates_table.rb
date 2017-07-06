class CreateDatesTable < ActiveRecord::Migration[5.0]
  def change
    create_table :dates do |t|
      t.datetime :date

      t.timestamps null: false
    end
  end
end
