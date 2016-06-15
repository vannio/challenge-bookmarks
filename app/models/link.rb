#A class which sets up the properties that we want our tables to have
class Link
	#Datamapper allows us to communicate with the database subject using ruby syntax
	include DataMapper::Resource

	#Adds a series of methods to models which allow users to create relationships and retreive related models
	has(n, :tags, through: Resource)

#Setting the column headers for our table
	property :id, Serial
	property :title, String
	property :url, String

end
