# RSpec.describe "user can edit conditions" do
#   it "from index" do
#     start_date = BikeShareDate.create(bike_share_date: '2013-08-06 00:00:00')
#     start_station_name = StationName.create(name: 'Moon Base One')
#     end_date = BikeShareDate.create(bike_share_date: '2013-08-07 00:00:00')
#     end_station_name = StationName.create(name: 'Elon Musk City')
#     subscription_type = SubscriptionType.create(name: 'Customer')
#     zip_code = ZipCode.create(zip_code: 12_345)
#     Trip.create(duration: 1, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)
#
#     visit '/trips'
#     click_button("Edit")
#     fill_in("trip[duration]", with: 666)
#     click_button("Submit")
#
#     expect(page).to have_content(666)
#     expect(page).to have_selector('tr', count: 2)
#     expect(current_path).to eq("/trips/1")
#   end
#
#   it "from id page" do
#     start_date = BikeShareDate.create(bike_share_date: '2013-08-06 00:00:00')
#     start_station_name = StationName.create(name: 'Moon Base One')
#     end_date = BikeShareDate.create(bike_share_date: '2013-08-07 00:00:00')
#     end_station_name = StationName.create(name: 'Elon Musk City')
#     subscription_type = SubscriptionType.create(name: 'Customer')
#     zip_code = ZipCode.create(zip_code: 12_345)
#     Trip.create(duration: 1, start_date_id: start_date.id, start_station_name_id: start_station_name.id, end_date_id: end_date.id, end_station_name_id: end_station_name.id, bike_id: 123, subscription_type_id: subscription_type.id, zip_code_id: zip_code.id)
#
#     visit '/trips/1'
#     click_button("Edit")
#     fill_in("trip[duration]", with: 666)
#     click_button("Submit")
#
#     expect(page).to have_content(666)
#     expect(page).to have_selector('tr', count: 2)
#     expect(current_path).to eq("/trips/1")
#   end
# end
