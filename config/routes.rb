Rails.application.routes.draw do
  
 
  get 'users/new'
  get 'users/create'
  get 'users/index'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :contents
  resources :comments, only: %i[create destroy]
  root 'contents#index'
end
