feature 'Adding tags to links' do

  scenario 'I can add a single tag to a link' do
    visit '/links/new'
    fill_in 'url', with: 'http://qz.com'
    fill_in 'title', with: 'This is Quartz'
    fill_in 'tags', with: 'news'

    click_button 'Create link'

    link = Link.first
    expect(link.tags.map(&:name)).to include('news')
  end

  scenario 'I can add multiple tags to a link' do
    visit '/links/new'
    fill_in 'url', with: 'http://qz.com'
    fill_in 'title', with: 'This is Quartz'
    fill_in 'tags', with: 'news, interesting'

    click_button 'Create link'

    link = Link.first
    expect(link.tags.map(&:name)).to include('news', 'interesting')
  end
end
