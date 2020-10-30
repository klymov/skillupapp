Rails.application.routes.draw do
  resources :users
  put 'assignment', to: 'orders#assignment'
  put 'performed', to: 'orders#performed'
  resources :orders
  root 'sessions#welcome', as: 'home'
  get 'signup',    to: 'users#new'
  get 'login',     to: 'sessions#new'
  post 'login',    to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'welcome',   to: 'sessions#welcome'
  get '/avatars/', to: redirect('/assets/images/avatars/')
end
