Rails.application.routes.draw do
  root 'orders#index'

  # get 'index' => 'orders/index'
  get 'orders/index'
  
  resources :orders
end
