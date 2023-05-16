# frozen_string_literal: true

Rails.application.routes.draw do
  root 'members#index'

  resources :members, only: %i[index new create]
  resources :tasks, only: %i[index new create update]
end
