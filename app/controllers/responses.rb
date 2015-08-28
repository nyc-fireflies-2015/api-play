post '/responses' do
  @response = Response.new(choice: _, user: current_user)

end
