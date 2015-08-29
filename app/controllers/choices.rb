get '/questions/:id/choices/new' do
  @question = Question.find_by(id: params[:id])
  "error" unless @question
  erb :'choices/new'
end

post '/choices' do
  @question = Question.find_by(id: params[:question_id])
  @question.add_choices(params[:choice])
  binding.pry
  # params[:choice].each do |index, choice|
  #   new_choice = @question.choices.build(body: choice[:body])
  #   "error" unless new_choice.save
  # end
  redirect "/surveys/#{@question.survey.id}/questions/new"
end
