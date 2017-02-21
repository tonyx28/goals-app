Rails.application.routes.draw do
  root "goals#index"

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :goals

  resources :user_comments, only: [:create, :destroy]
  resources :goal_comments, only: [:create, :destroy]
end
