get '/questions/:id/choices/new' do
  @question = Question.find_by(id: params[:id])
 	# fix all 404 error handling
 	# status 404 erb :somethingwrong unless @question
  erb :'choices/new'
end

post '/choices' do
  @question = Question.find_by(id: params[:question_id])
  @question.add_choices(params[:choice])
  redirect "/surveys/#{@question.survey.id}/questions/new"
end

get '/questions/:id/choices/edit' do
  @question = Question.find_by(id: params[:id])
  redirect "/" unless authorized?(@question.user.id)
	@choices = @question.choices
	erb :'choices/edit'
end

put '/questions/:id/choices' do
	question = Question.find_by(id: params[:id])
	question.update_choices(params[:choice])
	next_question = question.survey.next_question(question)
	if next_question.nil?
		redirect "/users/#{current_user.id}"
	else
		redirect "/questions/#{next_question.id}/edit"
	end
end

