Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pomodoro#index"
  #get 'pomodoro/index' , to: "pomodoro#index"
  
end
