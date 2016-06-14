require 'data_mapper'
require 'dm-postgres-adapter'

#A class which sets up the properties that we want our tables to have
class Link 
	#Datamapper allows us to communicate with the database subject using ruby syntax
	include DataMapper::Resource

#Setting the column headers for our table
	property :id, Serial
	property :title, String
	property :url, String

end

#Sets up the connection with the database - localhost is where the information will be sent
DataMapper.setup(:default, "postgres://localhost/bookmark_manager_test")
#Checks that everything works - An error should come up in the terminal if something is incorrect
DataMapper.finalize
#Builds the table according to our previous code
DataMapper.auto_upgrade!