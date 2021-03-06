post '/artworks/:artwork_id/likes' do
  artwork = Artwork.find(params[:artwork_id])

  if logged_in? && current_lover.id != artwork.artist.id
    current_lover.liked_artworks.push(artwork)
    current_lover.save!
  end

  content_type :json
  {likes: artwork.likes.count}.to_json
end

delete '/artworks/:artwork_id/likes' do
  artwork = Artwork.find(params[:artwork_id])

  if logged_in? && current_lover.id != artwork.artist.id
    current_lover.liked_artworks.delete(artwork)
    current_lover.save!
  end

  content_type :json
  {likes: artwork.likes.count}.to_json
end