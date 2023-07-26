Rails.application.routes.draw do
  
  devise_for :users, controllers: { registrations: 'user/registrations' }


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pomodoro#index"

#  post '/cronos', to: 'cronos#create'
#  resources :cronos, only: [:create, :update] do
#    member do
#      patch 'actualizar', to: 'cronos#update'
#    end
#    patch 'actualizarUltimo', to: 'cronos#actualizarUltimoCrono', on: :collection
#  end

resources :cronos, only: [:create, :update] do
  member do
    patch 'actualizar', to: 'cronos#update'
    delete 'borrar', to: 'cronos#borrar_crono'
  end
  patch 'actualizarUltimo', to: 'cronos#actualizarUltimoCrono', on: :collection
end


end
