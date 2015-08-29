post '/selections' do
  @taken_survey = TakenSurvey.find_by(id: params[:taken_survey_id])
  @choice = Choice.find_by(id: params[:choice_id])
  @selection = Selection.new(taken_survey: @taken_survey, user: current_user, choice: @choice)
  #flash errors
  "error" unless @selection.save
  next_question = @taken_survey.survey.next_question(@choice.question)
  redirect "/takensurveys/#{@taken_survey.id}" if next_question.nil?
  redirect "/takensurveys/#{@taken_survey.id}/questions/#{next_question.id}"
end
