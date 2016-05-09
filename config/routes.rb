Rails.application.routes.draw do

  get '/', to: 'home#index', as: 'home'

  get '/signin', to: 'sessions#signin', as: 'signin'
  post '/signin', to: 'sessions#authenticate', as: "auth"

  get '/users/new', to: 'users#new', as: 'signup'

  get '/signout', to: 'sessions#signout', as: 'signout'
  
  resources :rides
  resources :users, except: :new
  resources :attractions

end
