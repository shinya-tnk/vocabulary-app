Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations'
  }

  root to: 'vocabularies#index'
  resources :vocabularies do
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end
