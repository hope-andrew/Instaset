Rails.application.routes.draw do
  root to: "sessions#new"

  resources :users
  resource :session, only: [:new, :create, :destroy]

  namespace :api, defaults: { format: :json } do
    resources :photos
  end
end
