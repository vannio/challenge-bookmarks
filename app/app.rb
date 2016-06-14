
ENV['RACK_ENV'] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'


class BookmarkManager < Sinatra::Base
  get '/' do
    redirect '/links'
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
  	link = Link.new(url: params[:url], title: params[:title])
  	tag = Tag.first_or_create(name: params[:tags])
  	link.tags << tag
  	link.save
  	redirect('/links')
  end

  run! if app_file == $0
end
