post '/responses' do
  @taken_survey = TakenSurvey.find_by(id: params[:taken_survey_id])
  @choice = Choice.find_by(id: params[:choice_id])
  @response = Response.new
  # @taken_survey.responses.build(choice: @choice, user: current_user)
  # binding.pry
  "error" unless @response.save
  @next_question = @taken_survey.survey.next_question(@choice.question)
  redirect "/takensurveys/#{@taken_survey.id}" if @next_question.nil?
  redirect "/takensurveys/#{@taken_survey.id}/questions/#{@next_question.id}"
end
