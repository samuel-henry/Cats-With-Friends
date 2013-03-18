FridgeWithFriends::Application.routes.draw do
  resources :phrases
  resources :users do
    resources :phrases
  end

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :relationships, only: [:create, :destroy]
  #resources :sessions, only: [:new, :create, :destroy]
  #match '/signup', to: 'users#new'
  #match '/signin', to: 'sessions#new'
  #match '/signout', to: 'sessions#destroy'

  get "sign_in" => 'sessions#new', :as => :sign_in
  post "sessions/create"
  get "sessions/destroy" => 'sessions#destroy', :as => :sign_out

  root :to => 'users#index'
end
