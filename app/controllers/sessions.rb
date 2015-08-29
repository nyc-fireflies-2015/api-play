get '/login' do
  erb :'users/login'
end

post '/login' do
  if user = User.find_by(username: params[:username]).try(:authenticate, params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    flash[:error] = "Invalid login!"
    redirect '/login'
  end
end

delete '/session' do
  session.clear
  redirect '/'
end