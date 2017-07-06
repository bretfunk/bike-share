RSpec.describe Trip do
  describe 'class methods' do
    it '.average ride duration' do
      start_date = BikeShareDate.create(bike_share_date: '2013-08-06 00:00:00')
      start_station_name = StationName.create(name: 'Moon Base One')
      end_date = BikeShareDate.create(bike_share_date: '2013-08-07 00:00:00')
      end_station_name = StationName.create(name: 'Elon Musk City')
      subscription_type = SubscriptionType.create(name: 'Customer')
      zip_code = ZipCode.create(zip_code: 12_345)
      trip = Trip.create(duration: 1, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)

      result = Trip.average_duration_of_a_ride

      expect(result).to eq(1)
    end

    it '.longest ride' do
      start_date = BikeShareDate.create(bike_share_date: '2013-08-06 00:00:00')
      start_station_name = StationName.create(name: 'Moon Base One')
      end_date = BikeShareDate.create(bike_share_date: '2013-08-07 00:00:00')
      end_station_name = StationName.create(name: 'Elon Musk City')
      subscription_type = SubscriptionType.create(name: 'Customer')
      zip_code = ZipCode.create(zip_code: 12_345)
      trip = Trip.create(duration: 10, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)
      zip_code = ZipCode.create(zip_code: 12_345)
      Trip.create(duration: 100, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)

      result = Trip.longest_ride

      expect(result).to eq(100)
    end

    it '.shortest ride' do
      start_date = BikeShareDate.create(bike_share_date: '2013-08-06 00:00:00')
      start_station_name = StationName.create(name: 'Moon Base One')
      end_date = BikeShareDate.create(bike_share_date: '2013-08-07 00:00:00')
      end_station_name = StationName.create(name: 'Elon Musk City')
      subscription_type = SubscriptionType.create(name: 'Customer')
      zip_code = ZipCode.create(zip_code: 12_345)
      Trip.create(duration: 1, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)
      zip_code = ZipCode.create(zip_code: 12_345)
      Trip.create(duration: 100, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)

      result = Trip.shortest_ride

      expect(result).to eq(1)
    end

    it '.most_starting_station_rides' do
      start_date = BikeShareDate.create(bike_share_date: '2013-08-06 00:00:00')
      start_station_name = StationName.create(name: 'Moon Base One')
      diff_station_name = StationName.create(name: 'Jeff Bezos Town')
      end_date = BikeShareDate.create(bike_share_date: '2013-08-07 00:00:00')
      end_station_name = StationName.create(name: 'Elon Musk City')
      subscription_type = SubscriptionType.create(name: 'Customer')
      zip_code = ZipCode.create(zip_code: 12_345)
      Trip.create(duration: 1, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)
      zip_code = ZipCode.create(zip_code: 12_345)
      Trip.create(duration: 1, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)
      Trip.create(duration: 1, start_date_id: start_date.id, start_station_name_id: diff_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)

      result = Trip.most_starting_station_rides

      expect(result).to eq('Moon Base One')
    end

    it '.most_ending_station_rides' do
      start_date = BikeShareDate.create(bike_share_date: '2013-08-06 00:00:00')
      start_station_name = StationName.create(name: 'Moon Base One')
      diff_station_name = StationName.create(name: 'Jeff Bezos Town')
      end_date = BikeShareDate.create(bike_share_date: '2013-08-07 00:00:00')
      end_station_name = StationName.create(name: 'Elon Musk City')
      subscription_type = SubscriptionType.create(name: 'Customer')
      zip_code = ZipCode.create(zip_code: 12_345)
      Trip.create(duration: 1, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)
      zip_code = ZipCode.create(zip_code: 12_345)
      Trip.create(duration: 1, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)
      Trip.create(duration: 1, start_date_id: start_date.id, start_station_name_id: diff_station_name.id, end_date_id: end_date.id, end_station_name_id: diff_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)

      result = Trip.most_ending_station_rides

      expect(result).to eq('Jeff Bezos Town')
    end

    it '.least ridden bike' do
      start_date = BikeShareDate.create(bike_share_date: '2013-08-06 00:00:00')
      start_station_name = StationName.create(name: 'Moon Base One')
      end_date = BikeShareDate.create(bike_share_date: '2013-08-07 00:00:00')
      end_station_name = StationName.create(name: 'Elon Musk City')
      subscription_type = SubscriptionType.create(name: 'Customer')
      zip_code = ZipCode.create(zip_code: 12_345)
      Trip.create(duration: 1, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)
      zip_code = ZipCode.create(zip_code: 12_345)
      Trip.create(duration: 1, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)
      Trip.create(duration: 1, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 1, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)

      result = Trip.least_ridden_bike

      expect(result).to eq(1)
    end

    it '.most ridden bike' do
      start_date = BikeShareDate.create(bike_share_date: '2013-08-06 00:00:00')
      start_station_name = StationName.create(name: 'Moon Base One')
      end_date = BikeShareDate.create(bike_share_date: '2013-08-07 00:00:00')
      end_station_name = StationName.create(name: 'Elon Musk City')
      subscription_type = SubscriptionType.create(name: 'Customer')
      zip_code = ZipCode.create(zip_code: 12_345)
      Trip.create(duration: 1, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)
      zip_code = ZipCode.create(zip_code: 12_345)
      Trip.create(duration: 1, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)
      Trip.create(duration: 1, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 1, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)

      result = Trip.most_ridden_bike

      expect(result).to eq(123)
    end

    it '.most ridden bike number of rides' do
      start_date = BikeShareDate.create(bike_share_date: '2013-08-06 00:00:00')
      start_station_name = StationName.create(name: 'Moon Base One')
      end_date = BikeShareDate.create(bike_share_date: '2013-08-07 00:00:00')
      end_station_name = StationName.create(name: 'Elon Musk City')
      subscription_type = SubscriptionType.create(name: 'Customer')
      zip_code = ZipCode.create(zip_code: 12_345)
      Trip.create(duration: 1, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)
      zip_code = ZipCode.create(zip_code: 12_345)
      Trip.create(duration: 1, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)
      Trip.create(duration: 1, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 1, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)

      result = Trip.most_ridden_bike_number

      expect(result).to eq(2)
    end

    it '.least ridden bike number of rides' do
      start_date = BikeShareDate.create(bike_share_date: '2013-08-06 00:00:00')
      start_station_name = StationName.create(name: 'Moon Base One')
      end_date = BikeShareDate.create(bike_share_date: '2013-08-07 00:00:00')
      end_station_name = StationName.create(name: 'Elon Musk City')
      subscription_type = SubscriptionType.create(name: 'Customer')
      zip_code = ZipCode.create(zip_code: 12_345)
      Trip.create(duration: 1, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)
      zip_code = ZipCode.create(zip_code: 12_345)
      Trip.create(duration: 1, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)
      Trip.create(duration: 1, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 1, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)

      result = Trip.least_ridden_bike_number

      expect(result).to eq(1)
    end

    it '.day of highest trips' do
      start_date = BikeShareDate.create(bike_share_date: '2013-08-06 00:00:00')
      diff_date = BikeShareDate.create(bike_share_date: '2013-08-06 00:00:00')
      start_station_name = StationName.create(name: 'Moon Base One')
      end_date = BikeShareDate.create(bike_share_date: '2013-08-07 00:00:00')
      end_station_name = StationName.create(name: 'Elon Musk City')
      subscription_type = SubscriptionType.create(name: 'Customer')
      zip_code = ZipCode.create(zip_code: 12_345)
      Trip.create(duration: 1, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)
      zip_code = ZipCode.create(zip_code: 12_345)
      Trip.create(duration: 1, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)
      Trip.create(duration: 1, start_date_id: diff_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 1, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)

      result = Trip.day_of_highest_trips

      expect(result).to eq('2013-08-06 00:00:00')
    end

    it '.day of highest trips' do
      start_date = BikeShareDate.create(bike_share_date: '2013-08-06 00:00:00')
      diff_date = BikeShareDate.create(bike_share_date: '2013-08-06 00:00:00')
      start_station_name = StationName.create(name: 'Moon Base One')
      end_date = BikeShareDate.create(bike_share_date: '2013-08-07 00:00:00')
      end_station_name = StationName.create(name: 'Elon Musk City')
      subscription_type = SubscriptionType.create(name: 'Customer')
      zip_code = ZipCode.create(zip_code: 12_345)
      Trip.create(duration: 1, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)
      zip_code = ZipCode.create(zip_code: 12_345)
      Trip.create(duration: 1, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)
      Trip.create(duration: 1, start_date_id: diff_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 1, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)

      result = Trip.day_of_lowest_trips

      expect(result).to eq('2013-08-06 00:00:00')
    end

    it '.day of highest trips' do
      start_date = BikeShareDate.create(bike_share_date: '2013-08-06 00:00:00')
      diff_date = BikeShareDate.create(bike_share_date: '2013-08-06 00:00:00')
      start_station_name = StationName.create(name: 'Moon Base One')
      end_date = BikeShareDate.create(bike_share_date: '2013-08-07 00:00:00')
      end_station_name = StationName.create(name: 'Elon Musk City')
      subscription_type = SubscriptionType.create(name: 'Customer')
      zip_code = ZipCode.create(zip_code: 12_345)
      Trip.create(duration: 1, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)
      zip_code = ZipCode.create(zip_code: 12_345)
      Trip.create(duration: 1, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)
      Trip.create(duration: 1, start_date_id: diff_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 1, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)

      result = Trip.day_of_lowest_trips_number

      expect(result).to eq(1)
    end

    it '.day of highest trips' do
      start_date = BikeShareDate.create(bike_share_date: '2013-08-06 00:00:00')
      diff_date = BikeShareDate.create(bike_share_date: '2013-08-06 00:00:00')
      start_station_name = StationName.create(name: 'Moon Base One')
      end_date = BikeShareDate.create(bike_share_date: '2013-08-07 00:00:00')
      end_station_name = StationName.create(name: 'Elon Musk City')
      subscription_type = SubscriptionType.create(name: 'Customer')
      zip_code = ZipCode.create(zip_code: 12_345)
      Trip.create(duration: 1, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)
      zip_code = ZipCode.create(zip_code: 12_345)
      Trip.create(duration: 1, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)
      Trip.create(duration: 1, start_date_id: diff_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 1, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)

      result = Trip.day_of_highest_trips_number

      expect(result).to eq(2)
    end
  end

  it '#start_date' do
    start_date = BikeShareDate.create(bike_share_date: '2013-08-06 00:00:00')
    start_station_name = StationName.create(name: 'Moon Base One')
    end_date = BikeShareDate.create(bike_share_date: '2013-08-07 00:00:00')
    end_station_name = StationName.create(name: 'Elon Musk City')
    subscription_type = SubscriptionType.create(name: 'Customer')
    zip_code = ZipCode.create(zip_code: 12_345)
    trip = Trip.create(duration: 1, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)

    result = trip.start_date

    expect(result).to eq('2013-08-06 00:00:00')
  end

  it '#start_station_name' do
    start_date = BikeShareDate.create(bike_share_date: '2013-08-06 00:00:00')
    start_station_name = StationName.create(name: 'Moon Base One')
    end_date = BikeShareDate.create(bike_share_date: '2013-08-07 00:00:00')
    end_station_name = StationName.create(name: 'Elon Musk City')
    subscription_type = SubscriptionType.create(name: 'Customer')
    zip_code = ZipCode.create(zip_code: 12_345)
    trip = Trip.create(duration: 1, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)
    zip_code = ZipCode.create(zip_code: 12_345)

    result = trip.start_station_name

    expect(result).to eq('Moon Base One')
  end

  it '#end_date' do
    start_date = BikeShareDate.create(bike_share_date: '2013-08-06 00:00:00')
    start_station_name = StationName.create(name: 'Moon Base One')
    end_date = BikeShareDate.create(bike_share_date: '2013-08-07 00:00:00')
    end_station_name = StationName.create(name: 'Elon Musk City')
    subscription_type = SubscriptionType.create(name: 'Customer')
    zip_code = ZipCode.create(zip_code: 12_345)
    trip = Trip.create(duration: 1, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)

    result = trip.end_date

    expect(result).to eq('2013-08-07 00:00:00')
  end

  it '#end_station_name' do
    start_date = BikeShareDate.create(bike_share_date: '2013-08-06 00:00:00')
    start_station_name = StationName.create(name: 'Moon Base One')
    end_date = BikeShareDate.create(bike_share_date: '2013-08-07 00:00:00')
    end_station_name = StationName.create(name: 'Elon Musk City')
    subscription_type = SubscriptionType.create(name: 'Customer')
    zip_code = ZipCode.create(zip_code: 12_345)
    trip = Trip.create(duration: 1, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)

    result = trip.end_station_name

    expect(result).to eq('Elon Musk City')
  end
  # doesn't work below
  it '#subscription_type' do
    start_date = BikeShareDate.create(bike_share_date: '2013-08-06 00:00:00')
    start_station_name = StationName.create(name: 'Moon Base One')
    end_date = BikeShareDate.create(bike_share_date: '2013-08-07 00:00:00')
    end_station_name = StationName.create(name: 'Elon Musk City')
    subscription_type = SubscriptionType.create(name: 'Customer')
    zip_code = ZipCode.create(zip_code: 12_345)
    trip = Trip.create(duration: 1, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)

    result = trip.subscription_type

    expect(result).to eq('Customer')
  end

  it '#zip_code' do
    start_date = BikeShareDate.create(bike_share_date: '2013-08-06 00:00:00')
    start_station_name = StationName.create(name: 'Moon Base One')
    end_date = BikeShareDate.create(bike_share_date: '2013-08-07 00:00:00')
    end_station_name = StationName.create(name: 'Elon Musk City')
    subscription_type = SubscriptionType.create(name: 'Customer')
    zip_code = ZipCode.create(zip_code: 12_345)
    trip = Trip.create(duration: 1, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)

    result = trip.zip_code

    expect(result).to eq(12_345)
  end
end

describe 'validations' do

  it 'is invalid without a duration' do
    start_date = BikeShareDate.create(bike_share_date: '2013-08-06 00:00:00')
    start_station_name = StationName.create(name: 'Moon Base One')
    end_date = BikeShareDate.create(bike_share_date: '2013-08-07 00:00:00')
    end_station_name = StationName.create(name: 'Elon Musk City')
    subscription_type = SubscriptionType.create(name: 'Customer')
    zip_code = ZipCode.create(zip_code: 12_345)
    trip = TripForm.new(start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)

    expect(trip).to_not be_valid
  end

  it 'is invalid without a start date' do
    start_date = BikeShareDate.create(bike_share_date: '2013-08-06 00:00:00')
    start_station_name = StationName.create(name: 'Moon Base One')
    end_date = BikeShareDate.create(bike_share_date: '2013-08-07 00:00:00')
    end_station_name = StationName.create(name: 'Elon Musk City')
    subscription_type = SubscriptionType.create(name: 'Customer')
    zip_code = ZipCode.create(zip_code: 12_345)
    trip = TripForm.new(duration: 1, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)

    expect(trip).to_not be_valid
  end

  it 'is invalid without a end date' do
    start_date = BikeShareDate.create(bike_share_date: '2013-08-06 00:00:00')
    start_station_name = StationName.create(name: 'Moon Base One')
    end_date = BikeShareDate.create(bike_share_date: '2013-08-07 00:00:00')
    end_station_name = StationName.create(name: 'Elon Musk City')
    subscription_type = SubscriptionType.create(name: 'Customer')
    zip_code = ZipCode.create(zip_code: 12_345)
    trip = TripForm.new(duration: 1, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_station_name_id: end_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)

    expect(trip).to_not be_valid
  end

  it 'is invalid without a end station name' do
    start_date = BikeShareDate.create(bike_share_date: '2013-08-06 00:00:00')
    start_station_name = StationName.create(name: 'Moon Base One')
    end_date = BikeShareDate.create(bike_share_date: '2013-08-07 00:00:00')
    end_station_name = StationName.create(name: 'Elon Musk City')
    subscription_type = SubscriptionType.create(name: 'Customer')
    zip_code = ZipCode.create(zip_code: 12_345)
    trip = TripForm.new(duration: 1, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)

    expect(trip).to_not be_valid
  end

  it 'is invalid without a bike id' do
    start_date = BikeShareDate.create(bike_share_date: '2013-08-06 00:00:00')
    start_station_name = StationName.create(name: 'Moon Base One')
    end_date = BikeShareDate.create(bike_share_date: '2013-08-07 00:00:00')
    end_station_name = StationName.create(name: 'Elon Musk City')
    subscription_type = SubscriptionType.create(name: 'Customer')
    zip_code = ZipCode.create(zip_code: 12_345)
    trip = TripForm.new(duration: 1, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)

    expect(trip).to_not be_valid
  end

  it 'is invalid without a subscription type' do
    start_date = BikeShareDate.create(bike_share_date: '2013-08-06 00:00:00')
    start_station_name = StationName.create(name: 'Moon Base One')
    end_date = BikeShareDate.create(bike_share_date: '2013-08-07 00:00:00')
    end_station_name = StationName.create(name: 'Elon Musk City')
    subscription_type = SubscriptionType.create(name: 'Customer')
    zip_code = ZipCode.create(zip_code: 12_345)
    trip = TripForm.new(duration: 1, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 123, zip_code_id: zip_code.id)

    expect(trip).to_not be_valid
  end

  it 'is invalid without a zip code' do
    start_date = BikeShareDate.create(bike_share_date: '2013-08-06 00:00:00')
    start_station_name = StationName.create(name: 'Moon Base One')
    end_date = BikeShareDate.create(bike_share_date: '2013-08-07 00:00:00')
    end_station_name = StationName.create(name: 'Elon Musk City')
    subscription_type = SubscriptionType.create(name: 'Customer')
    zip_code = ZipCode.create(zip_code: 12_345)
    trip = TripForm.new(duration: 1, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id)

    expect(trip).to_not be_valid
  end

  it 'is invalid without anything' do
    start_date = BikeShareDate.create(bike_share_date: '2013-08-06 00:00:00')
    start_station_name = StationName.create(name: 'Moon Base One')
    end_date = BikeShareDate.create(bike_share_date: '2013-08-07 00:00:00')
    end_station_name = StationName.create(name: 'Elon Musk City')
    subscription_type = SubscriptionType.create(name: 'Customer')
    zip_code = ZipCode.create(zip_code: 12_345)
    trip = TripForm.new(duration: 1, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)

    expect(trip).to_not be_valid
  end
end
