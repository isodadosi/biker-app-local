Rails.application.routes.draw do
  
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'


  resources :contents
  resources :shops
  resources :sceneries
  resources :comments, only: %i[create destroy]
  resources :users, only: %i[new create index]
  resources :sessions, only: %i[new]
  root 'contents#index'
end
