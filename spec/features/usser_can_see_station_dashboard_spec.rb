RSpec.describe "User an see analystics" do
  it "from /station-dashboard" do
    station_name = StationName.create(name: "Test Station")
    install_date = BikeShareDate.create(bike_share_date: "2013-08-06 00:00:00")
    city = City.create(name: "Denver")
    station = Station.create(station_name_id: station_name.id, dock_count: 3, city_id: city.id,
              installation_date_id: install_date.id)

  visit '/station-dashboard'

  expect(page).to have_content("Fewest bikes available at a station:")
  end
end
