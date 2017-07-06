RSpec.describe "User visits '/'" do
  it "and sees the dashboard" do
    visit '/'
    expect(page).to have_content("Welcome")
  end
end
