module SessionHelpers

  def sign_in
    visit '/'
    fill_in 'registered_email', with: 'bob@bob.com'
    fill_in 'registered_password', with: 'password'
    click_button 'Sign in'
  end

  def sign_out
    click_button 'Sign out'
  end
end
