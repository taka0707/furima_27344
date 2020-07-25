Rails.application.routes.draw do
  get 'sending_destinations/index'
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :sending_destinations, only: [:index, :create]
  end
end
