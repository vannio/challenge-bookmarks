feature "Creating new links" do
  scenario "Adding a new link" do
    fill_in_title_and_url
    click_button "Submit"

    expect(current_path).to eq('/links')

    within "ul#links" do
      expect(page).to have_content "Title: Makers Academy"
    end
  end
end
