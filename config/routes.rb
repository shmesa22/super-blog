Rails.application.routes.draw do
  root 'posts#index'
  
  resources :users, only: [:new, :create]
  resources :posts
end
