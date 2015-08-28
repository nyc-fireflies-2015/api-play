get '/takensurveys/new' do
  @survey = Survey.find_by(id: params[:survey][:id])
  @taken_survey = TakenSurvey.new
  "error" unless @survey && @taken_survey
  erb :'taken_surveys/new'
end

get '/takensurveys/:id' do
  @taken_survey = TakenSurvey.find_by(id: params[:id])
  "error" unless @taken_survey
  erb :'taken_surveys/show'
end

post '/takensurveys' do
  @survey = Survey.find_by(id: params[:survey][:id])
  @taken_survey = TakenSurvey.new(taker: current_user, survey: @survey)
  "error" unless @survey && @taken_survey.save
  current_user.taken_surveys << @taken_survey
  @survey.taken_surveys << @taken_survey
  redirect "/questions/1"
end
