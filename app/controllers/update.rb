get '/updates' do

  if logged_in?

    # feed includes my updates
    # @feeds = Update.where("lover_id = ? ", current_lover.id) #.order("updated_at DESC")
    @feeds = Update.for_artwork_of_lover(current_lover.id)
    @feeds += Update.for_lover(current_lover.id) #.order("updated_at DESC")
    # feed includes updates for my artwork

    # feed includes updates from my leaders

    erb :'updates/index'
  else
    redirect '/'
  end
end

post '/updates' do

  if !current_lover.nil?
    current_lover.custom_updates.create!(text: params[:text])
  end

  if request.xhr?
    # AJAX
  else
    redirect '/'
  end
end



