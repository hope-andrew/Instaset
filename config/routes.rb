Rails.application.routes.draw do
  root to: "static_pages#root"

  resources :users
  resource :session, only: [:new, :create, :destroy]
  resources :static_pages, only: [:root]

  namespace :api, defaults: { format: :json } do
    resources :photos
  end
end
