feature 'Adding tags' do
	scenario 'User is able to add a single tag to a web link' do
	create_a_new_link

		link = Link.first
		expect(link.tags.map(&:name)).to include('coding')
	end

	scenario "User is able to add multiple tags to a web link" do
		visit('/links/new')
		fill_in('url', with: 'http://www.makersacademy.com/')
		fill_in('title', with: 'Makers Academy')
		fill_in('tags', with: 'coding, heavy petting, cars, pints')
		click_button 'Create Link'

		link = Link.first
		expect(link.tags.map(&:name)).to include('coding')
		expect(link.tags.map(&:name)).to include('heavy petting')
		expect(link.tags.map(&:name)).to include('cars')
		expect(link.tags.map(&:name)).to include('coding')

	end

	scenario 'User is able to view tags on the link page' do
		create_a_new_link
		visit('/links')
		expect(page).to have_content('coding')
	end
end
