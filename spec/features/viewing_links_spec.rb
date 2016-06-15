feature 'View links' do
  scenario 'I can see links on the page' do
  	Link.create(url: 'https://www.bbc.com', title: "BBC")
  	visit '/links'
  	expect(page.status_code).to eq 200
  	within 'ul#links' do
  	expect(page).to have_content("BBC") 		
  	end
  end
end
