RSpec.describe "User sees all stations" do
  it "when visiting '/stations'" do
    #set up necessary data
    names = ["sam", "bret", "marc", "matt"]
    names.each do |person|
      station = StationName.create(name: person)
      city = City.create(name: "Denver")
      date = BikeShareDate.create(bike_share_date: "2013-08-06 00:00:00")
      Station.create(station_name_id: station.id,
                     dock_count: 5,
                     city_id: city.id,
                     installation_date_id: date.id)
    end
    visit '/stations'

    names.each do |name|
    expect(page).to have_content(name)
    end
  end
end
