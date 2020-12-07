Rails.application.routes.draw do
  

  resources :offers, only: [:index]

  namespace :users do
    resources :offers do
      member do
        patch :enable, :disable
      end
    end
  end
end
