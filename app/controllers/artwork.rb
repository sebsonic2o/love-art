get '/artworks' do
  @home = false
  @browse = true
  @artworks = Artwork.all

  erb :'artworks/index'
end

get '/artworks/new' do
  if current_artist.nil?
    redirect '/'
  else
    erb :'artworks/new'
  end
end

post '/artworks' do
  if !current_artist.nil?
    current_artist.artworks.create!(
      title: params[:title],
      description: params[:description],
      image_url: params[:image_url],
      date: params[:date]
      )
  end

  redirect '/'
end

get '/artworks/:artwork_id' do
  @artwork = Artwork.find(params[:artwork_id])
  @home = false

  if !current_artist.nil? && @artwork.artist == current_artist
    @home = true
  end

  erb :'artworks/show'
end

get '/artworks/:artwork_id/edit' do
  @artwork = Artwork.find(params[:artwork_id])

  if !current_artist.nil? && @artwork.artist == current_artist
    erb :'artworks/edit'
  else
    redirect '/'
  end
end

put '/artworks/:artwork_id' do
  artwork = Artwork.find(params[:artwork_id])

  if !current_artist.nil? && artwork.artist == current_artist
    artwork.update_attributes!(
      title: params[:title],
      description: params[:description],
      image_url: params[:image_url],
      date: params[:date]
      )
  end

  redirect '/'
end

get '/artworks/:artwork_id/delete' do
  @artwork = Artwork.find(params[:artwork_id])

  if !current_artist.nil? && @artwork.artist == current_artist
    erb :'artworks/delete'
  else
    redirect '/'
  end
end

delete '/artworks/:artwork_id' do
  artwork = Artwork.find(params[:artwork_id])

  if !current_artist.nil? && artwork.artist == current_artist
    artwork.destroy
  end

  redirect '/'
end

get '/artists/:artist_id/artworks' do
  if session[:user_id].to_s == params[:artist_id]
    @home = true
    artist = current_artist
  else
    @home = false
    artist = Artist.find(params[:artist_id])
  end

  @artworks = artist.artworks

  erb :'artworks/index'
end