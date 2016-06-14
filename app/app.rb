require 'sinatra/base'

require_relative 'models/link'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Hello BookmarkManager!'
  end

  get '/links' do
  	@links = Link.all
  	erb(:'links/index')
  end

  
  run! if app_file == $0
end
