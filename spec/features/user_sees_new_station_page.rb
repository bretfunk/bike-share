RSpec.describe "User visits '/stations/new'" do
  it "and sees the new station page" do
    visit '/stations/new'
    expect(page).to have_content("Add a New Station")
  end
end
