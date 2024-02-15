# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    confirmations: 'users/confirmations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :users

  devise_scope :user do
    get 'users/auth/:provider/callback', to: 'users/omniauth_callbacks#github'
  end

  root to: 'tweets#index'
  resources :tweets
  post '/tweets', to: 'tweets#create'

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
