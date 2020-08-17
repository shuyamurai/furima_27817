Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root 'items#index'

  resources :items do
    resources :orders
  end
  resources :user_addresses, only: [:index]

end