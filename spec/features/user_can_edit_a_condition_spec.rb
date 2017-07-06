RSpec.describe "user can edit conditions" do
  it "from index" do
    date_str = DateTime.strptime('8/29/2013', '%m/%d/%Y')
    date = BikeShareDate.find_or_initialize_by(bike_share_date: date_str)
    zip_code = ZipCode.find_or_initialize_by(zip_code: 98059)
    Weather.create!(bike_share_date: date, max_temperature_f: 74.0, mean_temperature_f: 54, min_temperature_f: 43, mean_humidity: 32, mean_visibility_miles: 54, mean_humidity: 87, mean_wind_speed_mph: 97, precipitation_inches: 3)

    visit '/conditions'
    click_button("Edit")
    fill_in("weather[max_temperature_f]", with: "80")
    click_button("Update Condition")


    expect(page).to have_content(80)
    expect(page).to have_selector('tr', count: 2)
    expect(current_path).to eq("/conditions/1")
  end

  it "from id page" do
    date_str = DateTime.strptime('8/29/2013', '%m/%d/%Y')
    date = BikeShareDate.find_or_initialize_by(bike_share_date: date_str)
    zip_code = ZipCode.find_or_initialize_by(zip_code: 98059)
    Weather.create!(bike_share_date: date, max_temperature_f: 74.0, mean_temperature_f: 54, min_temperature_f: 43, mean_humidity: 32, mean_visibility_miles: 54, mean_humidity: 87, mean_wind_speed_mph: 97, precipitation_inches: 3)

    visit '/conditions/1'
    click_button("Edit")
    fill_in("weather[max_temperature_f]", with: "80")
    click_button("Update Condition")

    expect(page).to have_content(80)
    expect(page).to have_selector('tr', count: 2)
    expect(current_path).to eq("/conditions/1")
  end
end
