get '/' do
  erb :'home'
end

get '/something_bad_happened' do
  erb :'somethingwrong'
end

get '/login' do
  erb :'users/login'
end

