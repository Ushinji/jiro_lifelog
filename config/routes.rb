# frozen_string_literal: true

Rails.application.routes.draw do
  get "/login", to: "sessions#login"
  get "/auth/google/callback", to: "sessions#callback"

  namespace :api do
    resources :activities, only: [:index]
  end

  get "hoge", to: "root#index"

  root to: "dashboard#index"
  match "*any", to: "dashboard#index", via: :all
end
