Rails.application.routes.draw do
  
 
  resources :contents
  resources :comments, only: %i[create destroy]
  root 'contents#index'
end
