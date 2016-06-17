ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require 'sinatra/flash'
require 'bcrypt'

require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'super_secret'
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  post '/' do
    user = User.authenticate(params[:registered_email], params[:registered_password])
    if user
      session[:user_id] = user.id
    else
      flash[:messages] = ['The email/password combination is incorrect']
    end
    redirect '/'
  end

  get '/links' do
  	@links = Link.all
  	erb :'links/index'
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    params[:tags].split(',').each do |name|
      name.strip!
      tag = Tag.first_or_create(name: name)
      LinkTag.create(link: link, tag: tag)
    end
    redirect '/links'
  end

  get '/links/new' do
    erb :'links/new'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  post '/users' do
    @user = User.create(
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )

    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      flash.now[:messages] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/users/new' do
   @user = User.new
   erb :'users/new'
  end

  post '/session/end' do
    session[:user_id] = nil
    flash[:messages] = ["Successfully signed out"]
    redirect '/'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
