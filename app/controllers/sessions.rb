get '/login' do
  erb :'users/login'
end

post '/login' do
  user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
  if user
    session[:user_id] = user.id
    redirect '/'
  else
    flash[:error] = "Invalid login!"
    redirect '/login'
  end
end

delete '/logout' do
  session.clear
  redirect '/'
end