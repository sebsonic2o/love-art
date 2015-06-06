get '/updates' do

  if logged_in?

    @feeds = Update.get_all_for(current_lover.id)

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



