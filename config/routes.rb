# frozen_string_literal: true

Rails.application.routes.draw do
  get "/login", to: "sessions#login"
  get "/auth/google/callback", to: "sessions#callback"

  namespace :api do
    resources :activities, only: [:index, :create]
    resources :activity_parameters, only: [:index]
  end

  root to: "dashboard#index"
  match "*any", to: "dashboard#index", via: :all
end
