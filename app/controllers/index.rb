get '/' do
  if current_lover.nil?
    erb :index
  else
    if current_artist.nil?
      redirect "/lovers/#{current_lover.id}"
    else
      redirect "/artists/#{current_artist.id}"
    end
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
  "Hello love!"
end

