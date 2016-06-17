ENV['RACK_ENV'] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'


class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb(:index)
  end

  get '/links' do
  	@links = Link.all
  	erb(:'links/index')
  end

  get '/links/new' do
  	erb(:'links/new')
  end

  post '/links' do
  	link = Link.create(url: params[:url], title: params[:title])
    tags = params[:tags].split(", ").each do |tag|
      link.tags << Tag.first_or_create(name: tag)
    end

    link.save
  	redirect('/links')
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @name = params[:name]
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  post '/register' do
    user = User.create(name: params[:name], password: params[:password], password_test: params[:password_test], email: params[:email])
    session[:user_id] = user.id
    user.save
    redirect to('/links')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
