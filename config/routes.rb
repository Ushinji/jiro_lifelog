Rails.application.routes.draw do
  root to: 'root#index'

  match "dashboard", to: "dashboard#index", via: :all
  match "dashboard/*any", to: "dashboard#index", via: :all

  get "/login", to: "sessions#login"
  get "/auth/google/callback", to: "sessions#callback"
  resources :users
  resources :activities
end
