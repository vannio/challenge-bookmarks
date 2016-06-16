require_relative 'web_helper_spec'

feature 'Adding users' do

  scenario 'A new user signs up and adds one user' do
    sign_up
    expect{ sign_up }.to change(User, :count).by(1)
  end
    scenario 'A new user signs up and sees a welcome message' do
    sign_up
    expect(page).to have_content 'Welcome, bob@bob.com'
  end

    scenario 'A new user signs up and their e-mail is stored in the database' do
    sign_up
    expect(User.first.email).to eq 'bob@bob.com'
  end

  # scenario 'A new user types his password incorrectly' do
  #   visit '/users/new'
  #    fill_in 'email', with: 'bob@bob.com'
  #    fill_in 'password', with: 'password'
  #    fill_in 'password_confirmation', with: 'wrong password'
  #    click_button 'Sign up'
  #   expect(current_path).to eq('/users/new')
  #   expect(page).to have_content 'Re-enter password correctly'
  # end

  scenario 'requires a matching confirmation password' do
    # again it's questionable whether we should be testing the model at this
    # level.  We are mixing integration tests with feature tests.
    # However, it's convenient for our purposes.
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  def sign_up(email: 'bob@bob.com',
              password: '12345678',
              password_confirmation: '12345678')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end


 end
