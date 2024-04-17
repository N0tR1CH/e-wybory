require 'rswag/ui/engine'

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  get 'welcome', to: 'welcome#index'
  get 'welcome/testparameter/:id', to: 'welcome#testparameter'
  get 'welcome/testparameter2/:id', to: 'welcome#testparameter2'
  resources :roles
  devise_for :users
  root to: 'welcome#index'
end
