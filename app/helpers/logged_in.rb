def logged_in?
  return true if session[:user_id]
end