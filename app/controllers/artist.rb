get '/artists/:artist_id' do

  if !current_artist.nil? && current_artist.id.to_s == params[:artist_id]
    @artist = current_artist
    @home = true
  else
    @artist = Artist.find_by(id: params[:artist_id])
    redirect '/' if @artist.nil?
    @home = false
  end

  erb :'artists/show'
end
