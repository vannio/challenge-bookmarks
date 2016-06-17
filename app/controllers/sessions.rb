class BookmarkManager < Sinatra::Base
  delete '/sessions' do
    session[:user_id] = nil
    flash[:messages] = ["Successfully signed out"]
    redirect '/'
  end
end
