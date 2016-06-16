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


 end