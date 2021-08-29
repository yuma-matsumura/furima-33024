Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items
    resources :purchase_form, only: [:index, :create]