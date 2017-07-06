RSpec.describe "User visits '/trips/new'" do
  it "and sees the new trips page" do
    visit '/trips/new'
    expect(page).to have_content("Add A New Trip")
  end
end
