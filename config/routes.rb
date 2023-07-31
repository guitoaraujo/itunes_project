# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'albums#index'

  resources :albums, only: %i[index]
  resources :favourite_albums, only: %i[create destroy]
end
