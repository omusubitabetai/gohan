Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: 'users/sessions'
  }

  devise_for :admin, controllers: {
    sessions: 'admin/sessions'
  }

  root "homes#top"

  namespace :users do
    resources :users, only: [:show, :edit, :update]
    get  "/users/quit"  => "users#quit"
    resources :favorites, only: [:index]
    resources :foods
    resources :comments, only: [:create, :edit, :destroy]
    resources :requests, only: [:index, :destroy]
    get  "/requests/ok"  => "requests#ok"
    get  "/requests/thanks"  => "requests#thanks"
  end

  namespace :admin do
    get  "/homes/top"  => "homes#top"
    resources :users, only: [:index, :show, :edit, :update]
    resources :foods
    resources :requests, only: [:show, :update]
  end

end
