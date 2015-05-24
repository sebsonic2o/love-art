get '/' do
  if current_artist.nil?
    erb :index
  else
    redirect "/artists/#{current_artist.id}"
  end
end

get '/show' do
  if current_artist.nil?
    erb :'artists/new'
  end
end

get '/love' do
  "Hello love!"
end

get '/login' do
  erb :login
end

get '/logout' do
  session[:user_id] = nil

  redirect '/'
end

