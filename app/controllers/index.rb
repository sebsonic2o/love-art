get '/' do
  if current_artist.nil?
    erb :index
  else
    redirect "/artists/#{current_artist.id}"
  end
end

get '/show' do
  if current_artist.nil?
    erb :login
  else
    redirect '/'
  end
end

get '/love' do
  "Hello love!"
end

get '/register' do
  erb :register
end

post '/register' do
  if params[:artist].nil?
    post '/lovers', params
  else
    post '/artists', params
  end
end

get '/login' do
  erb :login
end

post '/login' do
  lover = Lover.find_by(alias: params[:alias])

  if !lover.nil?
    if lover.password == params[:password]
      session[:user_id] = lover.id
    end
  end

  redirect '/'
end

get '/logout' do
  session[:user_id] = nil

  redirect '/'
end

