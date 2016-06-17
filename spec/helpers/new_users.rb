module NewUsers

   def sign_up
     visit '/users/new'
      fill_in 'email', with: 'bob@bob.com'
      fill_in 'password', with: 'password'
      fill_in 'password_confirmation', with: 'password'
      click_button 'Sign up'
  end

  def user_create
    User.create(email: 'bob@bob.com',
                password: 'password',
                password_confirmation: 'password')
  end

end
