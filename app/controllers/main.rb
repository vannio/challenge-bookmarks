class BookmarkManager < Sinatra::Base
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
end
