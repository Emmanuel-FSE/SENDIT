Rails.application.routes.draw do
  resources :statuses, only: [:index, :update]
  resources :parcels, only: [:index, :show, :create, :update]
  resources :users, only: [:index, :show, :create, :update]
  resources :messages, only: [:index, :create]
  post "/login", to: "sessions#create"
  get "/logged-in", to: "users#logged_in"
  delete "/logout", to: "sessions#destroy"
  post "/reply", to: "messages#reply"
end
