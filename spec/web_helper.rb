def create_a_new_link
  visit("/links/new")
  fill_in("url", with: "http://www.makersacademy.com/")
  fill_in("title", with: "Makers Academy")
  fill_in("tags", with: "coding")
  click_button "Create Link"
end

def fill_in_name
  visit("/")
  fill_in("name", with: "Van")
end

def fill_in_matching_passwords
  fill_in("password", with: "password")
  fill_in("password_test", with: "password")
end

def fill_in_valid_email
  fill_in("email", with: "van@email.com")
end

def fill_in_valid_register_form
  fill_in_name
  fill_in_matching_passwords
  fill_in_valid_email
end
