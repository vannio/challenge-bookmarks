require "bcrypt"
require "dm-validations"

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :email, String
  property :password_digest, String, length: 60

  attr_reader :password
  attr_accessor :password_test
  validates_confirmation_of(:password, :confirm => :password_test)

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
