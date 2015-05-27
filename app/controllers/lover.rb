get '/lovers/login' do
  erb :'lovers/login'
end

post '/lovers/login' do
  lover = Lover.find_by(alias: params[:alias])

  # session[:artwork_ids] = nil

  if !lover.nil?
    if lover.password == params[:password]
      session[:user_id] = lover.id
    end
  end

  redirect '/'
end

get '/lovers/logout' do
  session[:user_id] = nil
  # session[:artwork_ids] = nil

  redirect '/'
end

get '/lovers/new' do
  erb :'lovers/new'
end

post '/lovers' do

  if params[:artist].nil?
    lover = Lover.new(
      alias: params[:alias],
      email: params[:email],
      first_name: params[:first_name],
      last_name: params[:last_name],
      image_url: params[:image_url],
      bio: params[:bio],
      website_url: params[:website_url]
      )
  else
    lover = Artist.new(
      alias: params[:alias],
      email: params[:email],
      first_name: params[:first_name],
      last_name: params[:last_name],
      image_url: params[:image_url],
      bio: params[:bio],
      website_url: params[:website_url]
      )
  end

  lover.password = params[:password]
  lover.save!

  session[:user_id] = lover.id
  # session[:artwork_ids] = nil

  redirect '/'
end

get '/lovers/:lover_id' do

  if session[:user_id].to_s == params[:lover_id]
    @lover = current_lover
    @home = true
  else
    @lover = Lover.find_by(id: params[:lover_id])
    redirect '/' if @lover.nil?
    @home = false
  end

  erb :'lovers/show'
end

get '/lovers/:lover_id/edit' do
  @lover = Lover.find(params[:lover_id])

  if @lover == current_lover
    erb :'lovers/edit'
  else
    redirect '/'
  end
end

put '/lovers/:lover_id' do
  lover = Lover.find(params[:lover_id])

  if lover == current_lover
    lover.update_attributes!(
      alias: params[:alias],
      email: params[:email],
      first_name: params[:first_name],
      last_name: params[:last_name],
      image_url: params[:image_url],
      bio: params[:bio],
      website_url: params[:website_url]
      )
  end

  redirect '/'
end

