Rails.application.routes.draw do
  resources :users
  resources :orders
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  
  root 'sessions#welcome', as: 'home'
end
