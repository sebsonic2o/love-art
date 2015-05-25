helpers do
  def current_artist
    @artist ||= Artist.find_by_id(session[:user_id]) if session[:user_id]
  end
end