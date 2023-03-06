Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root  to: 'pomodoro#index'
  get "/pomodoro", to: "pomodoro#index"
  get "/pomodoro/new", to: "pomodoro#new"
  post "/pomodoro/create", to: "pomodoro#create"

end
