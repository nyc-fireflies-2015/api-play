# survey_pony
survey monkey emulation

Controller Files:
  Welcome(/root)
    get "/" ** Home Page(two partials, one for logged in, one for not logged in)
    get "/login"  ** Login Page
    get "/signup"  ** Sign Up Page
  Sessions
    post "/sessions" | session#create  ** Creates a new session ie:login
    delete "/sessions/:id" | session#destroy  ** Destroys a session ie: logout
  Users
    get "/users/:id" | users#show
    post "/users" | users#create
  Surveys
    get "/surveys" | surveys#index
    get "/surveys/new" | surveys#new
    get "/surveys/:id" | surveys#show
    post "/surveys" | surveys#create
  Questions
    get "takensurvey/:id/questions/:id" | questions#show
    get "survey/:id/questions/new" | questions#new
    post "/questions" | questions#create
  Choices
    get "question/:id/choices/new" | choices#new
    post "/choices" | choices#create
  Responses
    post "/responses" | responses#create
  TakenSurveys
    post "/takensurveys" | takensurveys#create
    get "survey/:id/takensurveys/new" | takensurveys#new
    get "/takensurveys/:id" | takensurverys#show

