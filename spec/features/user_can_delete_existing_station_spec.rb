RSpec.describe "user can delete existing station" do
  it "from index" do
    station_name = StationName.create(name: "Test Station")
    install_date = BikeShareDate.create(bike_share_date: "2013-08-06 00:00:00")
    city = City.create(name: "Denver")
    station = Station.create(station_name_id: station_name.id, dock_count: 3, city_id: city.id,
              installation_date_id: install_date.id)

    visit '/stations'
    click_button("Delete")

    expect(page).to have_selector('tr', count: 1)
    expect(current_path).to eq("/stations")
  end

  it "from id page" do
    station_name = StationName.create(name: "Test Station")
    install_date = BikeShareDate.create(bike_share_date: "2013-08-06 00:00:00")
    city = City.create(name: "Denver")
    station = Station.create(station_name_id: station_name.id, dock_count: 3, city_id: city.id,
              installation_date_id: install_date.id)

    visit '/stations/1'
    click_button("Delete")

    expect(page).to have_selector('tr', count: 1)
    expect(current_path).to eq("/stations")
  end
end
