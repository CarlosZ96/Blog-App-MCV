# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get 'users', to: 'users#index', as: :users
  get 'users/:id', to: 'users#show', as: :user
  get 'users/:id/posts', to: 'posts#index', as: :posts
  get 'users/:id/posts/:id', to: 'posts#show', as: :post
  get 'new_post', to: 'posts#new', as: :new_post
  post 'new_post', to: 'posts#create', as: :create_post
  resources :posts, only: %i[show new create] do
    member do
      post 'like'
    end
    resources :comments, only: [:create]
  end
end
