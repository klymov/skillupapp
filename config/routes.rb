Rails.application.routes.draw do
  resources :users
  resources :orders
  get 'signup',    to: 'users#new'
  get 'login',     to: 'sessions#new'
  post 'login',    to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'welcome',   to: 'sessions#welcome'
  # get 'authorized', to: 'sessions#page_requires_login'

  root 'sessions#welcome', as: 'home'
end
