Rails.application.routes.draw do


  get 'user/index'

  get 'user/show'

  resources :lists
  resources :shows
  resources :movies
  devise_for :users
  # root "home#index"
  # get "public", to: "gossip#index"
  # get "secret", to: "secret#index"
  # get "really_secret", to: "secret#really_secret"

  devise_scope :user do
      authenticated :user do
        root 'home#index', as: :authenticated_root
      end

      unauthenticated do
        root 'devise/sessions#new', as: :unauthenticated_root
      end
    end

end
