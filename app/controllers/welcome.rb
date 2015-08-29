get '/' do
  erb :'home'
end

get '/something_bad_happened' do
  erb :'somethingwrong'
end
