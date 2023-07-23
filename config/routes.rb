# frozen_string_literal: true

Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  devise_for :users

  resources :users
  resources :podcasts
  resources :episodes

  root 'podcasts#index'
end
