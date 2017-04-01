Rails.application.routes.draw do
  root 'posts#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  
  resources :users, only: [:new, :create]
  resources :posts
end
