Rails.application.routes.draw do
  resources :statuses
  resources :parcels
  resources :users, only: [:index, :show, :create, :update]
end
