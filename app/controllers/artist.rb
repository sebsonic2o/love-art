get '/artists/:artist_id' do

  if current_artist.id.to_s == params[:artist_id]
    @home = true
  else
    @artist = Artist.find(params[:artist_id])
    redirect '/' if @artist.nil?
    @home = false
  end

  erb :'lovers/artists/show'
end
