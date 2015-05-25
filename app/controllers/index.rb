get '/' do
  if current_lover.nil?
    erb :index
  else
    if current_artist.nil?
      redirect '/artworks'
    else
      redirect "/artists/#{current_artist.id}/artworks"
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
  redirect '/artworks'
end

