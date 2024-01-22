# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    confirmations: 'users/confirmations'
  }

  root to: 'tweets#index'
  resources :tweets

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
