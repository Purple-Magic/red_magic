Rails.application.routes.draw do
  resources :podcasts
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root to: "welcome#index"
end
