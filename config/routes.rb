Rails3MongoidOmniauth::Application.routes.draw do
  root :to => "home#index"
  resources :users, :only => [ :show, :edit, :update ]
  match '/auth/:provider/callback' => 'sessions#create'
  match '/tw_signin' => 'sessions#twitter_signin'
  match '/fb_signin' => 'sessions#facebook_signin'
  match '/signout' => 'sessions#destroy', :as => :signout
  match '/auth/failure' => 'sessions#failure'
end
