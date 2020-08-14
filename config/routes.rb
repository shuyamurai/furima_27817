Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root 'items#index'
  
  resources :items, only: [:new, :create, :index, :show, :edit, :update]
end






# Rails.application.routes.draw do
#   devise_for :users, controllers: {
#     registrations: 'users/registrations',
#     sessions: 'users/sessions'
#   }
#   root 'items#index'
  
#   resources :items, only: [:new, :create]
# end
