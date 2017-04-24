Rails.application.routes.draw do


  get 'posts/new'

  get 'posts/edit'

  get 'posts/create'

  get 'posts/update'

  get 'posts/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :subs, except: [:destroy]
  resource :session
end
