get '/signup' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect to'/'
  else
    #add flash error
    redirect '/fail'
  end
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  if logged_in? && current_user==@user
    erb :'users/show'
  else
    "unauthorized error"
  end
end

get '/users/:id/edit' do
  @user = User.find_by(id: params[:id])
  if logged_in? && @user==current_user
  erb :'users/edit'
else
  "unauthorized error"
end
end

put '/users' do
  @user = User.find_by(id: session[:user_id])
  @user.update_attributes(params[:user])
  redirect '/'
end
