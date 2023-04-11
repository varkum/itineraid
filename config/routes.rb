Rails.application.routes.draw do
  resources :locations
  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  root "locations#index"
  get "sign_up", to: "users#new"
  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  delete "sign_out", to: "sessions#destroy"
  
  resources :users, path: '' do 
    resources :trips
  end 
  
end
