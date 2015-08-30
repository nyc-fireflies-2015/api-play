post '/selections' do
  @taken_survey = TakenSurvey.find_by(id: params[:taken_survey_id])
  @choice = Choice.find_by(id: params[:choice_id])
  @selection = Selection.new(taken_survey: @taken_survey, user: current_user, choice: @choice)
  next_question = @taken_survey.survey.next_question(@choice.question)

  if @selection.save
    if request.xhr?
      erb :"/taken_surveys/show", layout: false unless next_question
      erb :"/questions/_draw_question", layout: false, locals: {taken_survey: @taken_survey, question: next_question}
    else
      redirect "/takensurveys/#{@taken_survey.id}"
    end
  else
    flash[:error] = @selection.errors.full_messages
    redirect "/takensurveys/#{@taken_survey.id}/questions/#{params[:question_id]}"
  end
end
