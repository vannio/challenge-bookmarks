feature "Filter tags" do
  scenario "Provides a list of filtered links by tags" do
    Link.create(url: "http://makersacademy.com", title: "Makers Academy", tags: [Tag.first_or_create(name: "coding")])
    Link.create(url: "http://stackoverflow.com", title: "Stack Overflow", tags: [Tag.first_or_create(name: "coding")])
    Link.create(url: "http://google.com", title: "Google", tags: [Tag.first_or_create(name: "searching")])
    Link.create(url: "http://facebook.com", title: "Facebook")

    visit("/tags/coding")

    expect(page.status_code).to eq(200)
    expect(page).to have_content("coding")

    within "ul#links" do
      expect(page).to_not have_content("Facebook")
      expect(page).to_not have_content("searching")
      expect(page).to have_content("http://makersacademy.com")
      expect(page).to have_content("http://stackoverflow.com")
    end

  end
end
