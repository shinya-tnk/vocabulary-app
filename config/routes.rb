Rails.application.routes.draw do

  root to: 'vocabularies#index'
  resources :vocabularies
end
