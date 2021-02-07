Rails.application.routes.draw do
  devise_for :users
  root to: 'vocabularies#index'
  resources :vocabularies
end
