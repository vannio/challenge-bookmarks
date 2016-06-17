ENV["RACK_ENV"] ||= "development"
require "sinatra/base"
require "sinatra/flash"
require_relative "data_mapper_setup"
require "bcrypt"

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, "super secret"
  register Sinatra::Flash

  get "/" do
    erb(:index)
  end

  post "/" do
    @user = User.create(name: params[:name], password: params[:password], password_test: params[:password_test], email: params[:email])
    if @user.id
      session[:user_id] = @user.id
      @user.save
      redirect "/links"
    else
      flash.now[:notice] = @user.errors.full_messages
      erb(:index)
    end
  end

  post "/login" do
    @user = User.first(email: params[:email])
    if User.authenticate(params[:email], params[:password])
      session[:user_id] = @user.id
      redirect to('/links')
    else
      flash.now[:notice] = ["Email address/Password combination is incorrect"]
      erb(:index)
    end
  end

  get "/links" do
  	@links = Link.all
  	erb(:"links/index")
  end

  get "/links/new" do
  	erb(:"links/new")
  end

  post "/links" do
  	link = Link.create(url: params[:url], title: params[:title])
    tags = params[:tags].split(", ").each do |tag|
      link.tags << Tag.first_or_create(name: tag)
    end
    link.save
  	redirect("/links")
  end

  get "/tags/:name" do
    tag = Tag.first(name: params[:name])
    @name = params[:name]
    @links = tag ? tag.links : []
    erb :"links/index"
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
