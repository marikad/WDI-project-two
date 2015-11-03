Rails.application.routes.draw do
  devise_for :users
  resources :lists
  resources :movies, except: [:index] 
  get "discover", to: "movies#index"
  get "movies", to: "movies#films"
  get "tv_shows", to: "movies#tv_shows"
  resources :users, only: [:index, :show]

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
