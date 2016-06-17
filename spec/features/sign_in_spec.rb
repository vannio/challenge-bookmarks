feature 'allow user to sign in' do
  scenario 'user can sign in from any page' do
    sign_up
    visit '/'
    fill_in :registered_email, with: 'bob@bob.com'
    fill_in :registered_password, with: 'password'
    click_button 'Sign in'
    expect(page).to have_content('Welcome, bob@bob.com')
  end

  scenario 'returns a flash message if user doesn\'t exist' do
    sign_up
    visit '/'
    fill_in :registered_email, with: 'bob@bob.com'
    fill_in :registered_password, with: 'wrong_password'
    click_button 'Sign in'
    expect(page).to have_content('The email/password combination is incorrect')
  end
end
