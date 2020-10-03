Rails.application.routes.draw do
  root 'orders#index', as: 'home'

  # get 'index' => 'orders/index'
  # get 'orders/index'

  resources :orders, :users
end
