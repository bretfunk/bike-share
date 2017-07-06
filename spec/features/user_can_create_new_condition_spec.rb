RSpec.describe "user can create a condition" do
  it "with valid attributes" do
    visit '/conditions/new'
    fill_in("weather[date]", with: "2009/08/05")
    fill_in("weather[max_temperature_f]", with: "80")
    fill_in("weather[mean_temperature_f]", with: "75")
    fill_in("weather[min_temperature_f]", with: "70")
    fill_in("weather[mean_humidity]", with: "31")
    fill_in("weather[mean_visibility_miles]", with: "30")
    fill_in("weather[mean_humidity]", with: "31")
    fill_in("weather[mean_wind_speed_mph]", with: "7")
    fill_in("weather[precipitation_inches]", with: "5")
    click_button("Create Condition")

    condition = Weather.last
    expect(current_path).to eq("/conditions")
    expect(page).to have_content("2009-08-05")
  end
end
