Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#show'
      get '/backgrounds', to: 'background#show'
      resources :users, only: [:create]
      resources :sessions, only: [:create]
      post '/road_trip', to: 'roadtrip#show'
    end
  end
end