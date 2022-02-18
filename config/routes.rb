# frozen_string_literal: true

Rails.application.routes.draw do
  root "pages#home"

  resources :agents, only: :index

  resources :agencies, only: :index do
    collection do
      get "doo"
      get "sp"
    end
  end
end
