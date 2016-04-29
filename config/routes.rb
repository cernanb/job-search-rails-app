Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'jobs#index'

  resources :users, :controller => "users/users", only: [:edit, :update, :show, :index] do
    resources :applications, only: [:index]
  end

  resources :jobs, only: [:index, :new, :create, :show]

  resources :applications, only: [:create, :destroy]

end
