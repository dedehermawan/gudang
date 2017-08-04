Rails.application.routes.draw do
  
  get 'purchases/index'

  get 'sessions/new'

  root    'dashboards#index'

  get 		'/signup',  to: 'users#new'
  post		'/signup',  to: 'users#create'
  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'

  resources :users, :purchases
  resources :dashboards
  resources :items do
      get "brands", on: :collection
      get "delete"
      post "page"
  end

  resources :divisions, :brands, :warehouses, :units do
    get "delete"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
