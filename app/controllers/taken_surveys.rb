get '/surveys/:survey_id/takensurveys/new' do
  @survey = Survey.find_by(id: params[:survey_id])
  redirect '/something_bad_happened' unless @survey
  erb :'taken_surveys/new'
end

get '/takensurveys/:id' do
  taken_survey = TakenSurvey.find_by(id: params[:id])
  @taken_summary = taken_survey.taken_summary
  @survey = taken_survey.survey
  redirect '/something_bad_happened' unless taken_survey
  erb :'taken_surveys/show'
end

post '/takensurveys' do
  survey = Survey.find_by(id: params[:survey_id])
  taken_survey = TakenSurvey.new(taker: current_user, survey: survey)
  question = survey.next_question()
  if taken_survey.save
    if request.xhr?
      erb :"/questions/_draw_question", layout: false, locals: {question: question, taken_survey: taken_survey}
    else
      redirect "/takensurveys/#{taken_survey.id}/questions/#{survey.questions.first.id}"
    end
  else
    flash[:error] = taken_survey.errors.full_messages
    redirect "/survey/#{survey.id}/taken_surveys/new"
  end
end
