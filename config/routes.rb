Rails.application.routes.draw do
  resources :orders, except: [:edit, :update]

  resources :companies, only: [:index, :show] do
    resources :orders, only: [:index]
  end

  resources :users, except: [:edit, :update, :delete] do
    resources :deposits, only: [:index, :new, :create]
    resources :orders,   only: [:index, :new, :create]
  end

  resources :curve, only: [:index]

  get    '/signup',   to: 'users#new'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :demo

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'companies#index'
end
