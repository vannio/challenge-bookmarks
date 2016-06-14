feature 'View links' do
  scenario 'I can see links on the page' do
  	Link.create(url: 'https://qz.com', title: "Quartz")
  	visit "/links"
  	expect(page.status_code).to eq 200
  	within 'ul#link' do
  	expect(page).to have_content("Quartz") 		
  	end
  end
end