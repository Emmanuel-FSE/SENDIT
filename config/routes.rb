Rails.application.routes.draw do
  resources :statuses
  resources :parcels, only: [:index, :show, :create, :update]
  resources :users, only: [:index, :show, :create, :update]
end
