get '/signup' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    flash[:notice] = "Successful sign up!"
    redirect '/'
  else
    flash[:error] = user.errors.full_messages
    redirect '/signup'
  end
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  if logged_in? && current_user==@user
    erb :'users/show'
  else
    #unauth error messages
    flash[:error] = "You can only see your own profile!"
    redirect '/'
  end
end

get '/users/:id/edit' do
  @user = User.find_by(id: params[:id])
  if logged_in? && @user==current_user
    erb :'users/edit'
  else
    #unauth error messages
    flash[:error] = "You need to be logged in!"
    redirect '/login'
  end
end

put '/users' do
  @user = User.find_by(id: session[:user_id])
  @user.update_attributes(params[:user])
  redirect '/'
end
