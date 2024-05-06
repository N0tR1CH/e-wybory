# frozen_string_literal: true

require 'rswag/ui/engine'

Rails.application.routes.draw do
  resources :election_sheets, only: %i[new destroy]

  root to: 'welcome#index'

  resources :welcome, only: %i[index]

  resources :user_groups, :groups, :elections, :roles

  authenticate :user, ->(u) { u.role.name == 'admin' } do
    mount Rswag::Ui::Engine, at: '/api-docs'
    mount Rswag::Api::Engine, at: '/api-docs'
  end

  devise_for :users
end
