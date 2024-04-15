Rails.application.routes.draw do
  devise_for :users
  get 'welcome', to: 'welcome#index'
  root to: 'welcome#index'
end
