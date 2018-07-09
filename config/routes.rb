Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users
  root to: "home#index"
  
  namespace :api do
    resources :users, only: [:index]
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
