RSpec.describe "user can see one condition" do
  it "has attributes and buttons" do
    date_str = DateTime.strptime('3/9/2013', '%m/%d/%Y')
    date = BikeShareDate.find_or_initialize_by(bike_share_date: date_str)
    zip_code = ZipCode.find_or_initialize_by(zip_code: 32159)
    Weather.create!(bike_share_date: date, max_temperature_f: 74.0, mean_temperature_f: 54, min_temperature_f: 43, mean_humidity: 32, mean_visibility_miles: 54, mean_humidity: 87, mean_wind_speed_mph: 97, precipitation_inches: 3)

    visit '/conditions/1'

    expect(page).to have_content("Conditions for 2013-03-09")
    expect(page).to have_button("Edit")
    expect(page).to have_button("Delete")
  end
end
