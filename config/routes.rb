Rails.application.routes.draw do
  devise_for :users
  resources :lists
  resources :movies
  resources :users, only: [:index, :show]

  # root "home#index"
  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  root 'devise/sessions#new'
end
