feature "Adding new users" do
  scenario "User count increments by 1 when user registers" do
    visit("/")
    within ".register" do
      fill_in_valid_register_form
    end
    expect{click_button("Register")}.to change{User.all.length}.by 1
  end

  scenario "Displays welcome message for newly registered users" do
    visit("/")
    within ".register" do
      fill_in_valid_register_form
      click_button("Register")
    end
    expect(page).to have_content("Welcome, Van")
  end

  scenario "Email address submitted is the same as the one recorded in the database" do
    visit("/")
    within ".register" do
      fill_in_valid_register_form
      click_button("Register")
    end
    expect(User.first.email).to eq "van@email.com"
  end

  scenario "User can't sign up without an email address" do
    visit("/")
    within ".register" do
      fill_in_name
      fill_in_matching_passwords
      fill_in("email", with: "")
      click_button("Register")
    end
    expect(User.first).to be_nil
    expect(page).to have_content "Email must not be blank"
  end

  scenario "Improperly formatted email address does not create a user" do
    visit("/")
    within ".register" do
      fill_in_name
      fill_in_matching_passwords
      fill_in("email", with: "invalid@email")
      click_button("Register")
    end
    expect(User.first).to be_nil
    expect(page).to have_content "Email has an invalid format"
  end

  scenario "Different passwords do not create a user" do
    visit("/")
    within ".register" do
      fill_in_name
      fill_in("password", with: "password")
      fill_in("password_test", with: "not_the_same_password")
      fill_in_valid_email
      click_button("Register")
    end
    expect(User.first).to be_nil
    expect(current_path).to eq "/"
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario "User can't register with an already registered email address" do
    User.create(name: "Van", password: "password", password_test: "password", email: "van@email.com")
    visit("/")
    within ".register" do
      fill_in_valid_register_form
    end
    expect { click_button("Register") }.to_not change { User.all.count }
    expect(page).to have_content "Email is already taken"
  end
end
