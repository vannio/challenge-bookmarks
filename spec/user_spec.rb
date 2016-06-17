describe User do

  # Used let! because DatabaseCleaner cleans database before/after every test
  # let! forces method's invocation before each example
  let!(:user) {
    User.create(
      email: 'bob@bob.com',
      password: 'password',
      password_confirmation: 'password'
    )
  }

  let(:registered_password) { 'password' }

  it "gets authenticated if credentials are correct" do
    expect(BCrypt::Password.new(user.password_digest)).to eq(registered_password)
  end

  describe "#authenticate" do
    it "authenticates and returns a user" do
      expect(User.authenticate('bob@bob.com', 'password')).to eq(user)
    end

    it "fails authentication if user doesn't exist" do
      expect(User.authenticate('bob@cat.com', 'password')).to be_nil
    end
  end
end
