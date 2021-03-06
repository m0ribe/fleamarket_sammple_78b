Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  get '/users/logout', to: 'users#logout'
  resources :users, only: [:edit, :update, :index, :show]
  resources :products do
    member do
      get 'buy'
      post 'pay'
      get 'done'
    end
    collection do
      get 'search_child', defaults: { format: 'json' }
      get 'search_grandchild', defaults: { format: 'json' }
    end
  end
  resources :credit_card, only: [:new, :show] do
    collection do
      post 'show', to: 'credit_card#show'
      post 'pay', to: 'credit_card#pay'
      post 'delete', to: 'credit_card#delete'
    end
  end
  
end
