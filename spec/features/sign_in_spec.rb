feature 'allow user to sign in' do
  scenario 'user can sign in from any page' do
    sign_up
    visit '/'
    fill_in :registered_email, with: 'bob@bob.com'
    fill_in :registered_password, with: 'password'
    click_button 'Sign in'
    expect(page).to have_content('Welcome back, bob@bob.com!')
  end

end
