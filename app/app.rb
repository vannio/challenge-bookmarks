
ENV['RACK_ENV'] ||= "development"
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

  get '/links/new' do
  	erb(:'links/new')
  end
  
  post '/links' do
  	#params[:url] and params[:title] both look at the name inputs in add.erb
  	Link.create(url: params[:url], title: params[:title])
  	redirect('/links')
  end

  run! if app_file == $0
end
