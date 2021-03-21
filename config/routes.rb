Rails.application.routes.draw do
  devise_for :users
 root to: 'tweets#index'
 resources :tweets do
  resources :comments, only: [:new, :create]
 end
 resources :users, only: :show
end
