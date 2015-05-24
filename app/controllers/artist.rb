post '/artists' do
  artist = Artist.new(
    alias: params[:alias],
    email: params[:email],
    first_name: params[:first_name],
    last_name: params[:last_name],
    image_url: params[:image_url],
    bio: params[:bio],
    website_url: params[:website_url]
    )

  artist.password = params[:password]
  artist.save!

  session[:user_id] = artist.id

  redirect '/'
end

get '/artists/:artist_id' do
  p params[:artist_id]
  p current_artist.id
  if current_artist.id.to_s == params[:artist_id]
    @home = true
  else
    @artist = Artist.find(params[:artist_id])
    redirect '/' if @artist.nil?
    @home = false
  end

  erb :'artists/show'
end
