feature "Existing user login" do
  scenario "A user can sign in" do
    user = User.create(name: "Van", password: "password", password_test: "password", email: "van@email.com")
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user

    visit("/")
    within ".login" do
      fill_in("email", with: "van@email.com")
      fill_in("password", with: "password")
      click_button("Sign In")
    end
    expect(page).to have_content("Welcome, Van")
  end
end
