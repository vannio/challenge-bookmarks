
 def sign_up
   visit '/users/new'
    fill_in 'email', with: 'bob@bob.com'
    fill_in 'password', with: 'password'
    fill_in 'password_confirmation', with: 'password'
    click_button 'Sign up'
end

def sign_in
  visit '/'
  fill_in 'registered_email', with: 'bob@bob.com'
  fill_in 'registered_password', with: 'password'
  click_button 'Sign in'
end

def sign_out
  click_button 'Sign out'
end

def user_create
  User.create(email: 'bob@bob.com',
              password: 'password',
              password_confirmation: 'password')
end
