class User

include DataMapper::Resource

property :id, Serial
property :name, String
property :password, String
property :email, String

end
