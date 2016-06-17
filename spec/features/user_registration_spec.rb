feature 'Adding new users' do
  scenario 'User count increments by 1 when user registers' do
    expect{register_and_sign_in}.to change{User.all.length}.by 1
  end

  scenario 'Displays welcome message for newly registered users' do
    register_and_sign_in
    expect(page).to have_content('Welcome, Cameron')
  end

  scenario 'Email address is correct' do
    register_and_sign_in
    expect(User.first.email).to eq "cameron@gmail.com"
  end

  scenario 'Different passwords do not create a user' do
    visit('/')
    fill_in('name', with: 'Cameron')
    fill_in('password', with: 'password')
    fill_in('password_test', with: 'not_the_same_password')
    fill_in('email', with: 'cameron@gmail.com')
    click_button('Register')
    expect(User.first).to be_nil
  end
end
