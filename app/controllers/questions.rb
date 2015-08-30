get '/surveys/:id/questions/new' do
  @survey = Survey.find_by(id: params[:id])
  @question = Question.new
  # fix this - 404 error
  "error" unless @survey
  erb :'questions/new'
end

get '/takensurveys/:taken_survey_id/questions/:id' do
  @question = Question.find_by(id: params[:id])
  @taken_survey = TakenSurvey.find_by(id: params[:taken_survey_id])
  # fix this
  "error" unless @question && @taken_survey
  @choices = @question.choices
  erb :'questions/show'
end

post '/questions' do
  @survey = Survey.find_by(id: params[:survey_id])
  @question = @survey.questions.build(survey: @survey, body: params[:question][:body])
  #flash notices if saved correctly or not
  redirect "questions/#{@question.id}/choices/new"
end

get '/questions/:id/edit' do
  #private
  @question = Question.find_by(id: params[:id])
  #fix errors - redirect, flash error
  if @question.survey.created_by?(current_user)
    erb :'questions/edit'
  else
    "unauth"
  end  
end

put '/questions/:id' do 
  question = Question.find_by(id: params[:id])
  question.update_attributes(params[:question])
  redirect "/questions/#{question.id}/choices/edit"
end

delete '/questions/:id' do 
  question = Question.find_by(id: params[:id])
  question.destroy
  next_question = question.survey.next_question(question)
  if next_question.nil?
    redirect "/users/#{current_user.id}"
  else  
    redirect "/questions/#{next_question.id}/edit"
  end
end  
