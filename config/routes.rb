Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  authenticated :user do
    root 'jobs#index', as: :authenticated_root
  end
  root 'static#home'

  resources :users, :controller => "users/users", only: [:edit, :update, :show, :index] do
    resources :applications, only: [:index]
  end

  resources :jobs, only: [:index, :new, :create, :show] do
    resources :applications, only: [:new]
  end

  resources :applications, only: [:create, :destroy, :create, :show]
  # post 'applications/new' => 'applications#new'

end
