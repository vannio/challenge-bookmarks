require 'spec_helper'

feature 'Creating links' do
  scenario 'I can create a new link' do
    visit '/links/new'
    fill_in 'url', with: 'http://qz.com'
    fill_in 'title', with: 'This is Quartz'
    click_button('Create link')
    expect(current_path).to eq '/links'

    within 'ul#links' do
    expect(page).to have_content("This is Quartz")
    end
  end
 end 