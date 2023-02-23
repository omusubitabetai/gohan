Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  root "homes#top"

  namespace :users do
  resources :users, only: [:show, :edit, :update]
  get  "/users/quit"  => "users#quit"
  resources :favorites, only: [:index]
  resources :comments, only: [:create, :edit, :destroy]
  resources :requests, only: [:index, :destroy]
  get  "/requests/ok"  => "requests#ok"
  get  "/requests/thanks"  => "requests#thanks"
  end

  namespace :admins do
  resources :users, only: [:index, :show, :edit, :update]
  resources :requests, only: [:show, :update]
  end

  resources :foods
end
