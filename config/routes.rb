# frozen_string_literal: true

require 'rswag/ui/engine'

Rails.application.routes.draw do
  get 'election_sheet_candidates/new'
  get 'election_sheet_candidates/destroy'

  get 'elections/' => 'elections#current'
  get 'elections/recent' => 'elections#recent'
  get 'elections/current' => 'elections#current'
  get 'elections/upcoming' => 'elections#upcoming'

  resources :election_sheets, only: %i[new destroy] do
    member do
      post :vote, to: 'election_sheet_user_votes#create'
    end
  end
  resources :election_sheet_candidates, only: %i[new destroy]

  root to: 'welcome#index'

  resources :welcome, only: %i[index]

  resources :user_groups, :groups, :roles
  resources :elections do
    member do
      get :pdf_preview
      get :pdf
      get :vote
      get :results
    end
  end

  authenticate :user, ->(u) { u.role.name == 'admin' } do
    mount Rswag::Ui::Engine, at: '/api-docs'
    mount Rswag::Api::Engine, at: '/api-docs'
  end

  devise_for :users
end
