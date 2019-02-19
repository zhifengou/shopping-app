Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
        # post '/login', to: 'auth#create'
        # get '/profile', to: 'users#profile
      # resources :users, only: [:create]
      resources :users, :items, :categories
      post '/users',to: 'users#create'
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get '/items', to: 'items#index'
      get '/current_user', to: "auth#show"
end
