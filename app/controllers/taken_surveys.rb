get '/surveys/:survey_id/takensurveys/new' do
  @survey = Survey.find_by(id: params[:survey_id])
  "error" unless @survey
  erb :'taken_surveys/new'
end

get '/takensurveys/:id' do
  @taken_survey = TakenSurvey.find_by(id: params[:id])
  @survey = @taken_survey.survey
  "error" unless @taken_survey
  erb :'taken_surveys/show'
end

post '/takensurveys' do
  @survey = Survey.find_by(id: params[:survey_id])
  @taken_survey = TakenSurvey.new(taker: current_user, survey: @survey)
  "error" unless @taken_survey.save
  current_user.taken_surveys << @taken_survey
  @survey.taken_surveys << @taken_survey
  redirect "/takensurveys/#{@taken_survey.id}/questions/#{@survey.questions.first.id}"
end
