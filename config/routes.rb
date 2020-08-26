Rails.application.routes.draw do
  root "items#index"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items, only: [:index, :new, :create, :show]
end
