feature "Adding new users" do
  scenario "User count increments by 1 when user registers" do
    fill_in_valid_register_form
    expect{click_button("Register")}.to change{User.all.length}.by 1
  end

  scenario "Displays welcome message for newly registered users" do
    fill_in_valid_register_form
    click_button("Register")
    expect(page).to have_content("Welcome, Van")
  end

  scenario "Email address submitted is the same as the one recorded in the database" do
    fill_in_valid_register_form
    click_button("Register")
    expect(User.first.email).to eq "van@email.com"
  end

  scenario "User can't sign up without an email address" do
    fill_in_name
    fill_in_matching_passwords
    fill_in("email", with: "")
    click_button("Register")
    expect(User.first).to be_nil
  end

  scenario "Improperly formatted email address does not create a user" do
    fill_in_name
    fill_in_matching_passwords
    fill_in("email", with: "invalid@email")
    click_button("Register")
    expect(User.first).to be_nil
  end

  scenario "Different passwords do not create a user" do
    fill_in_name
    fill_in("password", with: "password")
    fill_in("password_test", with: "not_the_same_password")
    fill_in_valid_email
    click_button("Register")
    expect(User.first).to be_nil
    expect(current_path).to eq "/"
    expect(page).to have_content "Password and confirmation do not match"
  end
end
