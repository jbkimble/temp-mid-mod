Rails.application.routes.draw do
  root to: "links#index"

  resources :links, only: [:index, :update, :edit]
  resources :welcomes, only: [:index]

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  namespace :api do
    namespace :v1 do
      resources :links, only: [:create, :update]
      resources :hots, only: [:create]
    end
  end
end
