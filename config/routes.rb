# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    root to: 'application#index'
    resources :projects, only: [:new, :create, :destroy]
  end

  devise_for :users

  resources :projects do
    resources :tickets
  end
  root to: 'projects#index'
end
