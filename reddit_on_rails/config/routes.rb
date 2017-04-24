Rails.application.routes.draw do

  resources :users
  resources :subs, except: [:destroy]
  resource :session
  resources :posts, except: [:index]
  root 'subs#index'
end
