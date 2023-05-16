# frozen_string_literal: true

Rails.application.routes.draw do
  root 'members#index'

  resources :members, only: %i[index new create] do
    resources :tasks, only: %i[index new create update], module: :members
  end

  resources :tasks, only: %i[index new create update]
end
