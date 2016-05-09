Rails.application.routes.draw do

  get '/', to: 'home#index', as: 'home'
  get '/signin', to: 'users#signin', as: 'signin'
  get '/users/new', to: 'users#new', as: 'signup'
  post '/signin', to: 'users#authenticate'
  resources :rides

  resources :users, except: :new

  resources :attractions

end
