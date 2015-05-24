helpers do
  def current_lover
    @lover ||= Lover.find(session[:user_id]) if session[:user_id]
  end

  def current_artist
    @artist ||= Artist.find_by_id(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    session[:user_id]
  end
end
