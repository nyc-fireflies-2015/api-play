get "/surveys" do
  @surveys = Survey.limit(25).order(updated_at: :desc)
  erb :"/surveys/index"
end

get "/surveys/new" do
  @survey = Survey.new
  erb :"/surveys/new"
end

get "/surveys/:id" do
  @survey = Survey.find_by(id: params[:id])
  erb :"/surveys/show"
end

post "/surveys" do
  survey = current_user.created_surveys.create(params[:survey])
  redirect "/surveys/#{survey.id}/questions/new"
end

get "/surveys/:id/edit" do
end

put "/surveys/:id" do
end

delete "/surveys/:id" do
end
