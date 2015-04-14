Rails.application.routes.draw do
  root to: "static_pages#root"

  # resources :static_pages, only: [:root, :splash]
  get 'static_pages/root', to: "static_pages#root"
  get 'static_pages/splash', to: "static_pages#splash"
  resources :users
  resource :session, only: [:new, :create, :destroy]
  resources :static_pages, only: [:root]

  namespace :api, defaults: { format: :json } do
    resources :photos do
      resources :comments
      resources :likes
    end
  end
end
