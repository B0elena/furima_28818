Rails.application.routes.draw do
  root "items#index"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items do
    resources :buys, only:[:index, :new, :create] 
    resources :comments, only:[:index, :new, :create]
    resources :likes, only:[:new, :create, :destroy]
    collection do
      get 'search'
    end
  end
end
