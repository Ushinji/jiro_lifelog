# frozen_string_literal: true

Rails.application.routes.draw do
  get "/login", to: "sessions#login"
  get "/auth/google/callback", to: "sessions#callback"

  root to: "dashboard#index"
  match "*any", to: "dashboard#index", via: :all
end
