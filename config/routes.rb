Rails.application.routes.draw do
  get 'order/index'
  # get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :orders

  #root 'order#index'
end
