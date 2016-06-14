feature 'Adding tags' do
	scenario 'User is able to add tags to web links' do 
		visit('/links/new')
		fill_in('url', with: 'http://www.makersacademy.com/')
		fill_in('title', with: 'Makers Academy')
		fill_in('tags', with: 'coding')

		click_button 'Create Link'
		link = Link.first
		expect(link.tags.map(&:name)).to include('coding')
	end 
end