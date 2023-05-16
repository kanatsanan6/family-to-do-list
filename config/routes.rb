# frozen_string_literal: true

Rails.application.routes.draw do
  root 'members#index'

  resources :members, only: %i[index new create] do
    resources :tasks, only: %i[index new create update], module: :members
  end

  resource :tasks, only: :destroy
  resources :tasks, only: %i[index new create update]

  namespace :api do
    namespace :v1 do
      resources :tasks, only: :index
    end
  end

  mount Sidekiq::Web => '/sidekiq'
end
