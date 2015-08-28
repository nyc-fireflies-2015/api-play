get "/surveys" do
  @surveys = Survey.limit(25).order(updated_at: :desc)
  erb :"/surveys/index"
end

get "/surveys/new" do
  erb :"/surveys/new"
end

get "/surveys/:id" do
  @survey = Survey.find_by(id: params[:id])
  erb :"/surveys/show"
end

post :"/surveys" do
  current_user.created_surveys.create(params[:survey])
  # The association from the last created survey of the current user is how this question will be tied to the survey.
  redirect "/questions/new"
end
