feature 'Adding sites' do
	scenario 'Able to add url to bookmark manager' do
		create_a_new_link
		expect(current_path).to eq '/links'
		within 'ul#links' do
			expect(page).to have_content('Makers Academy')
		end
	end
end
