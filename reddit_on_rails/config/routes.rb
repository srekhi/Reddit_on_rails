Rails.application.routes.draw do

  resources :comments, only: [:create, :show]
  resources :users
  resources :subs, except: [:destroy]
  resource :session
  resources :posts, except: [:index] do
    resources :comments, only: [:new]
  end
  root 'subs#index'
end
