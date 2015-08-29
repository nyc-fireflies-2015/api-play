get '/surveys/:survey_id/takensurveys/new' do
  @survey = Survey.find_by(id: params[:survey_id])
  redirect '/something_bad_happened' unless @survey
  erb :'taken_surveys/new'
end

get '/takensurveys/:id' do
  @taken_survey = TakenSurvey.find_by(id: params[:id])
  "error" unless @taken_survey
  erb :'taken_surveys/show'
end

post '/takensurveys' do
  @survey = Survey.find_by(id: params[:survey_id])
  @taken_survey = TakenSurvey.new(taker: current_user, survey: @survey)
  "error" unless @taken_survey.save
  redirect "/takensurveys/#{@taken_survey.id}/questions/#{@survey.questions.first.id}"
end
