Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :messages
  resources :snapshots, only: :create

  root 'messages#index'
end
