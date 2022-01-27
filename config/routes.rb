Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :products do
    resources :booking_requests, only: [:new, :create]
  end
  resources :booking_requests, only: [:index, :show, :destroy]
  get "/booking_requests/:id/accept", to: "booking_requests#accept", as: :accept_booking
  get "/search", to: "products#search"
end
