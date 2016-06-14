feature "Creating new links" do
  scenario "Adding a new link" do
    visit('/')
    fill_in :title, with: "Makers Academy"
    fill_in :url, with: "http://www.makersacademy.com"
    click_button "Submit"
    expect(page).to have_content "Title: Makers Academy"
  end
end
