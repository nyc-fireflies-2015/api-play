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
	@question = Question.find_by(id: params[:id])
	@choices = @question.choices
	erb :'choices/edit'
end

put '/questions/:id/choices' do 
	@question = Question.find_by(id: params[:id])
	binding.pry
	@question.choices.each_with_index do |choice, i|
		choice.update_attributes(params[:choice]["#{i}"])
	end	
	binding.pry
end

delete '/choices/:id' do 
end	
