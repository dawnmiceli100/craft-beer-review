Rails.application.routes.draw do
  
  root to: 'reviews#index'

  resources :beers, except: [:destroy] do
    resources :reviews, except: [:destroy]
  end
  
  resources :users, except: [:destroy]  

  resources :breweries, except: [:destroy]

  resources :styles, except: [:destroy]

end
