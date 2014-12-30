CraftBeerReview.application.routes.draw do
  
  root to: 'reviews#index'

  resources :beers, except: [:destroy] do
    resources :reviews, only: [:create]
  end
  
  resources :users, except: [:destroy]  

  resources :breweries, only: [:new, :create, :show,]

  resources :styles, only: [:new, :create, :show]

end
