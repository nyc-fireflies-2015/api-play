get '/questions/:id/choices/new' do
  @question = Question.find_by(id: params[:id])
  "error" unless @question
  erb :'choices/new'
end

post '/choices' do
  @question = Question.find_by(id: params[:question_id])
  @question.add_choices(params[:choice])
  redirect "/surveys/#{@question.survey.id}/questions/new"
end

get '/questions/:id/choices/edit' do 
end

put '/choices/:id' do 
end

delete '/choices/:id' do 
end	
