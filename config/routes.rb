Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products do
    resources :booking_requests, only: [ :new, :create ]
  end
  resources :booking_requests, only: [ :index, :accept, :reject ]
end
