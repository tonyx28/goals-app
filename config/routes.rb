Rails.application.routes.draw do
  root "goals#index"

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :goals

  resources :comments, only: [:create, :destroy]
end
