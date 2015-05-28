helpers do
  def current_artist
    @current_artist ||= Artist.find_by(id: session[:user_id]) if session[:user_id]
  end
end