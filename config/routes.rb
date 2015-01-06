Rails.application.routes.draw do
  
  root to: 'reviews#index'

  get '/register', to: 'users#new'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :beers, except: [:destroy] do
    resources :reviews, except: [:destroy]
  end
  
  resources :users, except: [:destroy]  

  resources :breweries, except: [:destroy]

  resources :styles, except: [:destroy]

end
