Rails.application.routes.draw do

  root to: 'pages#home'
  devise_for :users
  resources :products do
    resources :booking_requests, only: [:new, :create]
  end
  resources :booking_requests, only: [:index, :show, :edit, :update, :accept, :reject, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products do
    resources :booking_requests, only: [ :new, :create ]
  end
  resources :booking_requests, only: [ :index, :accept, :reject ]
end
