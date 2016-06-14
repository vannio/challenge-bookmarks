def fill_in_title_and_url
  visit('/links/new')
  fill_in :title, with: "Makers Academy"
  fill_in :url, with: "http://www.makersacademy.com"
end
