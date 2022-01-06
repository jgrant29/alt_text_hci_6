Rails.application.routes.draw do
  resources :alts
  devise_for :users
  root "alts#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
