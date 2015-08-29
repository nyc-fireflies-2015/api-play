get '/surveys/:id/questions/new' do
  @survey = Survey.find_by(id: params[:id])
  @question = Question.new
  "error" unless @survey && @question
  erb :'questions/new'
end

get '/takensurveys/:taken_survey_id/questions/:id' do
  @question = Question.find_by(id: params[:id])
  @taken_survey = TakenSurvey.find_by(id: params[:taken_survey_id])
  "error" unless @question && @taken_survey
  @choices = @question.choices
  erb :'questions/show'
end

post '/questions' do
  @survey = Survey.find_by(id: params[:survey_id])
  @question = @survey.questions.build(survey: @survey, body: params[:question][:body])
  "error" unless @question.save
  redirect "questions/#{@question.id}/choices/new"
end

get '/questions/:id/edit' do
  @question = Question.find_by(id: params[:id])
  @survey = @question.survey
  if @question
    erb :'questions/edit'
  else
    "error"
  end  
end

put '/questions/:id' do 
end

delete '/questions/:id' do 
end  
