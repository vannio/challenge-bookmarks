require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/link'
require_relative 'models/tag'
require_relative 'models/user'

#Sets up the connection with the database - localhost is where the information will be sent
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
#Checks that everything works - An error should come up in the terminal if something is incorrect
DataMapper.finalize
#Builds the table according to our previous code
DataMapper.auto_upgrade!
