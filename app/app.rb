ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  get '/' do
  	"Hello!"
  end

  get '/links' do
  	@links = Link.all
  	erb :'links/index'
  end

  get '/links/new' do
  	erb :'links/new'
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    params[:tags].split(',').each do |name|
      name.strip!
      tag = Tag.first_or_create(name: name)
      LinkTag.create(link: link, tag: tag)
    end
    #link.tags << tag
    #link.save
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end


  run! if app_file == $0
end
