Rails.application.routes.draw do
  # match "/dashboard", to: "dashboard#index", via: :all
  # match "/dashboard/*any", to: "dashboard#index", via: :all

  get "/login", to: "sessions#login"
  get "/auth/google/callback", to: "sessions#callback"
  
  root to: 'dashboard#index'
  match "*any", to: "dashboard#index", via: :all

  # resources :users
  # resources :activities
end
