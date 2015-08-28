get '/questions/new' do
  @survey = Survey.find_by(id: params[:survey][:id])
  @question = Question.new
  "error" unless @survey && @question
  erb :'questions/new'
end

get '/takensurveys/:taken_surveys_id/questions/:id' do
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
  redirect "question/#{@question.id}/choices/new"
end
