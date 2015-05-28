helpers do
  def current_lover
    @current_lover ||= Lover.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    session[:user_id]
  end
end
