Rails.application.routes.draw do
  resources :statuses
  resources :contact, only: [:create]
  resources :parcels, only: [:index, :show, :create, :update]
  resources :users, only: [:index, :show, :create, :update]
  post "/login", to: "sessions#create"
  get "/logged-in", to: "users#logged_in"
  delete "/logout", to: "sessions#destroy"
end
