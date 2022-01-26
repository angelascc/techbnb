Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :products do
    resources :booking_requests, only: [:new, :create]
  end
  resources :booking_requests, only: [:index, :show, :edit, :update, :destroy]
end
