get '/' do
  if current_lover.nil?
    erb :index
  else
    redirect "/updates"
  end
end

get '/show' do
  if current_lover.nil?
    redirect '/lovers/login'
  else
    redirect '/'
  end
end

get '/love' do
  redirect '/artworks'
end

