RSpec.describe Weather do
  describe 'weather can manipulate date' do
    it 'date returns only date information' do
      date_str = DateTime.strptime('3/9/2013', '%m/%d/%Y')
      date = BikeShareDate.find_or_initialize_by(bike_share_date: date_str)
      zip_code = ZipCode.find_or_initialize_by(zip_code: 32159)
      condition_1 = Weather.create!(bike_share_date: date, max_temperature_f: 74.0, zip_code: zip_code)

      result = condition_1.date

      expect(result).to eq('2013-03-09')
    end

    it 'date returns zip as integer' do
      date_str = DateTime.strptime('3/9/2013', '%m/%d/%Y')
      date = BikeShareDate.find_or_initialize_by(bike_share_date: date_str)
      zip_code = ZipCode.find_or_initialize_by(zip_code: 32159)
      condition_1 = Weather.create!(bike_share_date: date, max_temperature_f: 74.0, zip_code: zip_code)

      result = condition_1.date
      expect(result).to eq('2013-03-09')
    end
  end
end
