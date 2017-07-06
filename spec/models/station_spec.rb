RSpec.describe Station do
  describe "class methods" do
    it ".total_station_count" do
      station_name = StationName.create(name: "Test Station")
      install_date = BikeShareDate.create(bike_share_date: "2013-08-06 00:00:00")
      city = City.create(name: "Denver")
      station = Station.create(station_name_id: station_name.id, dock_count: 99, city_id: city.id,
                installation_date_id: install_date.id)

        result = Station.total_station_count

        expect(result).to eq(1)
    end

    it "returns average bikes per station" do
      station_name = StationName.create(name: "Test Station")
      install_date = BikeShareDate.create(bike_share_date: "2013-08-06 00:00:00")
      city = City.create(name: "Denver")
      station = Station.create(station_name_id: station_name.id, dock_count: 20, city_id: city.id,
                installation_date_id: install_date.id)
      station2 = Station.create(station_name_id: station_name.id, dock_count: 10, city_id: city.id,
                installation_date_id: install_date.id)

      result = Station.average_bikes_per_station

      expect(result).to eq(15)
    end

    it "returns most bikes available" do
      station_name = StationName.create(name: "Test Station")
      install_date = BikeShareDate.create(bike_share_date: "2013-08-06 00:00:00")
      city = City.create(name: "Denver")
      station = Station.create(station_name_id: station_name.id, dock_count: 20, city_id: city.id,
                installation_date_id: install_date.id)
      station1 = Station.create(station_name_id: station_name.id, dock_count: 10, city_id: city.id,
                installation_date_id: install_date.id)

      result = Station.most_bikes_available

      expect(result).to eq(station.station_name.name)
    end

    it "returns stations with most bikes" do
      station_name = StationName.create(name: "Test Station")
      station_name_1 = StationName.create(name: "Super Duper Doritos")
      station_name_2 = StationName.create(name: "Meow Wolf")
      station_name_3 = StationName.create(name: "Lizzy")
      station_name_4 = StationName.create(name: "Jack Skeleton")
      station_name_5 = StationName.create(name: "Barney")
      install_date = BikeShareDate.create(bike_share_date: "2013-08-06 00:00:00")
      install_date_2 = BikeShareDate.create(bike_share_date: "2014-09-15 00:00:00")
      city = City.create(name: "Denver")
      station = Station.create(station_name_id: station_name.id, dock_count: 20, city_id: city.id,
                installation_date_id: install_date.id)
      station1 = Station.create(station_name_id: station_name_1.id, dock_count: 20, city_id: city.id,
                installation_date_id: install_date.id)
      station2 = Station.create(station_name_id: station_name_2.id, dock_count: 20, city_id: city.id,
                installation_date_id: install_date.id)
      station3 = Station.create(station_name_id: station_name_3.id, dock_count: 20, city_id: city.id,
                installation_date_id: install_date.id)
      station4 = Station.create(station_name_id: station_name_4.id, dock_count: 20, city_id: city.id,
                installation_date_id: install_date.id)
      station5 = Station.create(station_name_id: station_name_5.id, dock_count: 5, city_id: city.id,
                installation_date_id: install_date_2.id)


      result = Station.stations_with_most_bikes
      expected = Station.where(installation_date_id: install_date.id)

      expect(result[0]).to eq(expected[0])
    end

    it "returns stations with fewest bikes available" do
      station_name = StationName.create(name: "Test Station")
      install_date = BikeShareDate.create(bike_share_date: "2013-08-06 00:00:00")
      city = City.create(name: "Denver")
      station = Station.create(station_name_id: station_name.id, dock_count: 20, city_id: city.id,
                installation_date_id: install_date.id)
      station1 = Station.create(station_name_id: station_name.id, dock_count: 10, city_id: city.id,
                installation_date_id: install_date.id)

      result = Station.fewest_bikes_avaiable

      expect(result).to eq(station1.station_name.name)
    end

    it "returns stations with fewest bikes" do
      station_name = StationName.create(name: "Test Station")
      station_name_1 = StationName.create(name: "Super Duper Doritos")
      station_name_2 = StationName.create(name: "Meow Wolf")
      station_name_3 = StationName.create(name: "Lizzy")
      station_name_4 = StationName.create(name: "Jack Skeleton")
      station_name_5 = StationName.create(name: "Barney")
      install_date = BikeShareDate.create(bike_share_date: "2013-08-06 00:00:00")
      install_date_2 = BikeShareDate.create(bike_share_date: "2014-09-15 00:00:00")
      city = City.create(name: "Denver")
      station = Station.create(station_name_id: station_name.id, dock_count: 3, city_id: city.id,
                installation_date_id: install_date.id)
      station1 = Station.create(station_name_id: station_name_1.id, dock_count: 3, city_id: city.id,
                installation_date_id: install_date.id)
      station2 = Station.create(station_name_id: station_name_2.id, dock_count: 3, city_id: city.id,
                installation_date_id: install_date.id)
      station3 = Station.create(station_name_id: station_name_3.id, dock_count: 3, city_id: city.id,
                installation_date_id: install_date.id)
      station4 = Station.create(station_name_id: station_name_4.id, dock_count: 3, city_id: city.id,
                installation_date_id: install_date.id)
      station5 = Station.create(station_name_id: station_name_5.id, dock_count: 5, city_id: city.id,
                installation_date_id: install_date_2.id)


      result = Station.stations_with_fewest_bikes
      expected = Station.where(installation_date_id: install_date.id)

      expect(result[0]).to eq(expected[0])
    end

      it "returns most recently installed station" do
        station_name_1 = StationName.create(name: "Super Duper Doritos")
        station_name_2 = StationName.create(name: "Meow Wolf")
        install_date_1 = BikeShareDate.create(bike_share_date: "2013-08-06 00:00:00")
        install_date_2 = BikeShareDate.create(bike_share_date: "2014-09-15 00:00:00")
        city = City.create(name: "Denver")
        station1 = Station.create(station_name_id: station_name_1.id, dock_count: 20, city_id: city.id,
                  installation_date_id: install_date_1.id)
        station2 = Station.create(station_name_id: station_name_2.id, dock_count: 20, city_id: city.id,
                  installation_date_id: install_date_2.id)

        result = Station.most_recent_station

        expect(result).to eq(station2.station_name.name)
      end

      it "returns oldest station" do
        station_name_1 = StationName.create(name: "Super Duper Doritos")
        station_name_2 = StationName.create(name: "Meow Wolf")
        install_date_1 = BikeShareDate.create(bike_share_date: "2013-08-06 00:00:00")
        install_date_2 = BikeShareDate.create(bike_share_date: "2014-09-15 00:00:00")
        city = City.create(name: "Denver")
        station1 = Station.create(station_name_id: station_name_1.id, dock_count: 20, city_id: city.id,
                  installation_date_id: install_date_1.id)
        station2 = Station.create(station_name_id: station_name_2.id, dock_count: 20, city_id: city.id,
                  installation_date_id: install_date_2.id)

        result = Station.oldest_station

        expect(result).to eq(station1.station_name.name)
      end
  end

  describe "instance methods" do
    context "#installation_date returns date" do
      it "returns date from bike_share_dates table" do
        install_date = BikeShareDate.create(bike_share_date: "2013-08-06 00:00:00")
        city = City.new(name: "Denver")
        station = Station.create(station_name_id: 1, dock_count: 99, city_id: city.id,
                  installation_date_id: install_date.id)

        result = station.installation_date

        expect(result).to eq("2013-08-06 00:00:00")
      end
    end

    describe "#name returns station name" do
      it "returns name from station_name table" do
        station_name= StationName.create(name: "Bret")
        station = Station.create(station_name_id: station_name.id, dock_count: 99, city_id: 1,
                  installation_date_id: 1)
        result = station.name

        expect(result).to eq("Bret")
      end
    end

    describe "#city returns city name" do
      it "returns name from cities table" do
        city = City.create(name: "Denver")
        station = Station.create(station_name_id: 1, dock_count: 99, city_id: city.id,
                  installation_date_id: 1)

        result = station.city

        expect(result).to eq("Denver")
      end
    end
  end

  describe "validations" do
    it "is invalid without a name" do
      install_date = BikeShareDate.new(bike_share_date: 2120-07-05)
      city = City.new(name: "Denver")
      station = StationForm.new(dock_count: 99, city_id: city.id,
                installation_date_id: install_date.id)

      expect(station).to_not be_valid
    end

    it "is invalid without an install date" do
      station_name = StationName.new(name: "Test Station")
      city = City.new(name: "Denver")
      station = StationForm.new(station_name_id: station_name.id, dock_count: 99, city_id: city.id)

      expect(station).to_not be_valid
    end

    it "it is invalid without a city" do
      station_name = StationName.new(name: "Test Station")
      install_date = BikeShareDate.new(bike_share_date: 2120-07-05)
      station = StationForm.new(station_name_id: station_name.id, dock_count: 99,
                installation_date_id: install_date.id)

      expect(station).to_not be_valid
    end

    it "is invalid without a dock count" do
      station_name = StationName.new(name: "Test Station")
      install_date = BikeShareDate.new(bike_share_date: 2120-07-05)
      city = City.new(name: "Denver")
      station = StationForm.new(station_name_id: station_name.id, city_id: city.id,
                installation_date_id: install_date.id)

      expect(station).to_not be_valid
    end
  end
end
