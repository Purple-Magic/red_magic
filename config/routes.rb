Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :messages
  resources :podcasts
  resources :snapshots, only: :create

  root 'podcasts#index'
end
