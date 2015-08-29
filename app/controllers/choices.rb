get '/questions/:id/choices/new' do
  @question = Question.find_by(id: params[:id])
  "error" unless @question
  erb :'choices/new'
end

post '/choices' do
  @question = Question.find_by(id: params[:question_id])
  @choice = @question.choices.build(body: params[:choice][:body])
  "error" unless @choice.save
  redirect "/surveys/#{@question.survey.id}/questions/new"
end
