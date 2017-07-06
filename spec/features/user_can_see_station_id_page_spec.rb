RSpec.describe "User can see station/id page" do
  it "sees station/id" do
    names = ["sam"]
    names.each do |person|
      station = StationName.create(name: person)
      city = City.create(name: "Denver")
      date = BikeShareDate.create(bike_share_date: "2013-08-06 00:00:00")
      Station.create(station_name_id: station.id,
                     dock_count: 5,
                     city_id: city.id,
                     installation_date_id: date.id)
    end
    visit "/stations/#{Station.find(1).id}"

    expect(page).to have_content("sam")
  end
end
