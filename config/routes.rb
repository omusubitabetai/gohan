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
    patch '/users/out' => 'users#out'
    get "/users/quit"  => "users#quit"
    resources :users, only: [:show, :edit, :update] do
      member do
        get :favorites
        get :requests
      end
    end
    resources :foods do
      resources :comments, only: [:create, :destroy]
      resources :requests, only: [:create, :destroy]
      get "/requests/:id/ok" => "requests#ok", as: "requests_ok"
      get "/requests/:id/thanks" => "requests#thanks", as: "requests_thanks"
      resources :favorites, only: [:create, :destroy]
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
