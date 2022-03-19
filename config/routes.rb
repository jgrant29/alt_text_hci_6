Rails.application.routes.draw do
  resources :alt_texts
  resources :alts
  resources :verifcations
  
  
  devise_for :users
  root "alts#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
