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
  erb :'/users/show' if @user==current_user
  "unauthorized error"
end

get '/users/:id/edit' do
  @user = User.find_by(id: params[:id])
  erb :'/users/edit' if @user==current_user
  "unauthorized error"
end

put '/users' do
  @user = User.find_by(id: session[:user_id])
  @user.update_attributes(params[:user])
  redirect '/'
end
