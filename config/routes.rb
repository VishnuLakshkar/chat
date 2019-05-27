Rails.application.routes.draw do
  root 'users#index'
  devise_for :users

  get 'home/index'

  resources :users, only: [:index, :show]
  resources :users do
    member do
      get :block_list
    end
  end

  resources :conversations, only: [:create] do
    member do
      post :close
    end

    resources :messages, only: [:create]
  end
  
  resources :relationships, only: [:create, :destroy]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
