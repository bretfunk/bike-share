RSpec.describe "user can see conditions" do
  it "shows all conditions with buttons" do
    date_str = DateTime.strptime('8/29/2013', '%m/%d/%Y')
    date = BikeShareDate.find_or_initialize_by(bike_share_date: date_str)
    zip_code = ZipCode.find_or_initialize_by(zip_code: 98059)
    Weather.create!(bike_share_date: date, max_temperature_f: 74.0, mean_temperature_f: 54, min_temperature_f: 43, mean_humidity: 32, mean_visibility_miles: 54, mean_humidity: 87, mean_wind_speed_mph: 97, precipitation_inches: 3)

    visit '/conditions'

    expect(page).to have_content('Weather')
    expect(page).to have_content('74')
    expect(page).to have_button('Edit')
    expect(page).to have_button('Delete')
  end

  it "only shows 31 records, with headers" do
    31.times do
      date_str = DateTime.strptime('8/29/2013', '%m/%d/%Y')
      date = BikeShareDate.find_or_initialize_by(bike_share_date: date_str)
      zip_code = ZipCode.find_or_initialize_by(zip_code: 98059)
      Weather.create!(bike_share_date: date, max_temperature_f: 74.0, mean_temperature_f: 54, min_temperature_f: 43, mean_humidity: 32, mean_visibility_miles: 54, mean_humidity: 87, mean_wind_speed_mph: 97, precipitation_inches: 3)
    end

    visit '/conditions'

    expect(page).to have_selector('tr', count: 31)
  end
end
