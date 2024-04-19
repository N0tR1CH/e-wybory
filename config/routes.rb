require 'rswag/ui/engine'

Rails.application.routes.draw do
  resources :user_groups
  resources :groups
  authenticate :user, ->(u) { u.role.name == 'admin' } do
    mount Rswag::Ui::Engine, at: '/api-docs'
    mount Rswag::Api::Engine, at: '/api-docs'
  end

  get 'welcome', to: 'welcome#index'

  resources :roles

  devise_for :users

  root to: 'welcome#index'
end
