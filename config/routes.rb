Rails.application.routes.draw do
  put 'assignment', to: 'orders#assignment'
  resources :users
  put 'assignment', to: 'orders#assignment'

  resources :orders
  root 'sessions#welcome', as: 'home'

  get 'signup',    to: 'users#new'
  get 'login',     to: 'sessions#new'
  post 'login',    to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'welcome',   to: 'sessions#welcome'
  # get 'authorized', to: 'sessions#page_requires_login'

end
