Rails.application.routes.draw do
  devise_for :users
  resources :lists
  resources :lists_movies
  resources :users, only: [:show, :edit, :update]
  resources :movies, except: [:index] do
    member do
      put "like", to: "movies#upvote"
      put "dislike", to: "movies#downvote"
      put "novote", to: "movies#novote"
    end
  end
  get "discover", to: "movies#index"
  get "movies", to: "movies#films"
  get "tv_shows", to: "movies#tv_shows"
  resources :users, only: [:index, :show]
  resources :comments, only: [:create, :destroy]

  devise_scope :user do
    authenticated :user do
      root 'movies#films', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  root 'devise/sessions#new'
end
