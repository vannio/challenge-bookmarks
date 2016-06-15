def create_a_new_link
  visit('/links/new')
  fill_in('url', with: 'http://www.makersacademy.com/')
  fill_in('title', with: 'Makers Academy')
  fill_in('tags', with: 'coding')
  click_button 'Create Link'
end
