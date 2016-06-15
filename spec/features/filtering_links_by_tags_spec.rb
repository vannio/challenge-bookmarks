feature 'Filtering links by tag' do

   before(:each) do
	 link_1 = Link.create(url: 'http://qz.com', title: 'This is Quartz')
     link_2 = Link.create(url: 'http://bbc.com', title: 'This is BBC')
     tag_1 = Tag.first_or_create(name: 'news')
   	 tag_2 = Tag.first_or_create(name: 'sport')
   	 LinkTag.create(link: link_1, tag: tag_1)
   	 LinkTag.create(link: link_2, tag: tag_2)
   	end

  scenario 'I can filter links by a tag' do
    visit '/tags/news' 

      expect(page.status_code).to eq 200

   	  within 'ul#links' do
      expect(page).to have_content("news")
      expect(page).not_to have_content("sport")
    end
  end

end 


 # tags: [Tag.first_or_create(name: 'news')]
 # link_1.tags << tag_1
 #    link_1.save
 #    link_2.tags << tag_2
 #    link_2.save