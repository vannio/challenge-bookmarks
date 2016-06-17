ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'data_mapper_setup'

# app_file is set with the first file that requires Sinatra
require_relative 'server'

require_relative 'controllers/main'
require_relative 'controllers/links'
require_relative 'controllers/tags'
require_relative 'controllers/sessions'
require_relative 'controllers/users'

class BookmarkManager < Sinatra::Base
  # run! if app_file == $0
  run! if app_file == 'server.rb'
end
