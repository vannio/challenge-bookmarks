feature "Tagging links" do
  scenario "can add a tag to a link" do
    fill_in_title_and_url
    fill_in(:tags, with: "code")
    click_button("Submit")

    link = Link.first
    expect(link.tags.map(&:name)).to include("code")
  end
end
