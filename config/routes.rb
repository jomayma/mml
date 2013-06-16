Mml::Application.routes.draw do
  get "welcome/home"
  get '/home', to: 'home#index', as: 'home'

  #resources :sessions
  #get '/auth/twitter/callback', to: 'sessions#create', as: 'callback'
  #get 'auth/twitter', to: 'sessions#create', as: 'login'
  #match 'auth/:provider/callback' => 'sessions#create',:as => 'login'
  get '/auth/:provider/callback', to: 'sessions#create', as: 'login'
  get '/profile', to: 'sessions#show', as: 'show'
  match 'logout' => 'sessions#destroy'
  delete '/signout', to: 'sessions#destroy', as: 'signout'
  
  get '/reviews', to: 'reviews#all', as: 'reviews'
  resources :books do
    resources :reviews
  end
  resources :readers
  #root :to => redirect('/books')
  root :to => redirect('/home')
end
