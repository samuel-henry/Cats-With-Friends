FridgeWithFriends::Application.routes.draw do
  resources :posts

  #nested route to /users/:id/posts
  resources :users do
    resources :posts
  end

  #nested route for upvoting a post
  resources :posts do
     member do
       get 'upvote'
     end
   end

  #nested routes for /users/:id/followers /following 
  resources :users do
    member do
      get :following, :followers
    end
  end

  #resources for creating and destroying relationships (sounds like my life)
  resources :relationships, only: [:create, :destroy]

  #routes for signing in/out
  get "sign_in" => 'sessions#new', :as => :sign_in
  post "sessions/create"
  get "sessions/destroy" => 'sessions#destroy', :as => :sign_out

  #root goes to index of posts
  root :to => 'posts#index'
end
