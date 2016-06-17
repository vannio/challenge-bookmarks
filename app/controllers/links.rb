class BookmarkManager < Sinatra::Base
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
end
