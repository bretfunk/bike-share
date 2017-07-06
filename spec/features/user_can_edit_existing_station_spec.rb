RSpec.describe "User edits existing station" do
  it "with valid attributes" do
    station_name = StationName.create(name: "Test Station")
    install_date = BikeShareDate.create(bike_share_date: "2013-08-06 00:00:00")
    city = City.create(name: "Denver")
    station = Station.create(station_name_id: station_name.id, dock_count: 3, city_id: city.id,
              installation_date_id: install_date.id)

    visit '/stations/1/edit'
    fill_in("station[name]", with: "Buster")
    fill_in("station[dock_count]", with: 5)
    fill_in("station[city]", with: "SF")
    fill_in("station[installation_date]", with: "2013-08-06 00:00:00")
    click_button("Submit")

    station = Station.last
    expect(current_path).to eq("/stations/1")
    expect(page).to have_content("Buster")
  end
end
