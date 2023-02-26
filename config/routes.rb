Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: 'users/sessions'
  }

  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  root "homes#top"

  scope module: :users do
    resources :users, only: [:show, :edit, :update]
    get "/users/quit"  => "users#quit"
    resources :favorites, only: [:index]
    resources :foods do
      resources :comments, only: [:create, :edit, :destroy]
      resources :requests, only: [:index, :destroy]
      get "/requests/:id/ok" => "requests#ok"
      get "/requests/:id/thanks" => "requests#thanks"
    end
  end

  namespace :admins do
    get "/homes/top" => "homes#top"
    resources :users, only: [:index, :show, :edit, :update]
    resources :foods do
      resources :requests, only: [:show, :update]
    end
  end

    post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
end
