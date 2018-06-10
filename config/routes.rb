Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'root#index'
  get "/login", to: "sessions#login"
  get "/auth/google/callback", to: "sessions#callback"
  resources :users
  resources :activities
end
