Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users
  get 'items/tsearch'
  resources :users, only:[:edit, :update]
  resources :items do
    resources :orders, only:[:index, :create]
    resources :favorites, only:[:create, :destroy]
    collection do
      get 'search'
    end
  end
end
