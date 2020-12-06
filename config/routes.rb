Rails.application.routes.draw do
  devise_for :users, path: '/',
  path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'register',
    sign_up: 'new'
  },
  controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    confirmations: 'users/confirmations'
  }

  devise_scope :user do
    unauthenticated :user do
      root 'pages#home', as: :unauthenticated_root
    end
    authenticated do
      root 'pages#home', as: :authenticated_root
    end
  end

  resources :offers, only: [:index]

  namespace :users do
    resources :offers
  end
end
