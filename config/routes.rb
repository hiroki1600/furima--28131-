Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  get 'items/tsearch'
  resources :users, only:[:edit, :update]
  resources :items do
    resources :orders, only:[:index, :create]
    resources :favorites, only:[:create, :destroy]
    resources :messages, only:[:create]
    collection do
      get 'search'
    end
  end
end
