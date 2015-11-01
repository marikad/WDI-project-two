Rails.application.routes.draw do
  resources :lists
  resources :movies
  devise_for :users
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
end
