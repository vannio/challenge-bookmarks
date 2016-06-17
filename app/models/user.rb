require "bcrypt"
require "dm-validations"

class User
  include DataMapper::Resource

  property(:id, Serial)
  property(:name, String)
  property(:email, String, format: :email_address, required: true, unique: true)
  property(:password_digest, String, length: 60)

  attr_reader :password
  attr_accessor :password_test

  validates_confirmation_of(:password, confirm: :password_test)

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)

    # The Password.new returns an object that has a different implementation of the equality(`==`)
    # method. Instead of comparing two passwords directly
    # (which is impossible because we only have a one-way hash)
    # the == method calculates the candidate password_digest from
    # the password given and compares it to the password_digest
    # it was initialised with.
    # So, to recap: THIS IS NOT A STRING COMPARISON
    if user && BCrypt::Password.new(user.password_digest) == password
      # return this user
      user
    else
      nil
    end
  end
end
