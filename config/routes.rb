Mml::Application.routes.draw do
  #resources :sessions
  #get '/auth/twitter/callback', to: 'sessions#create', as: 'callback'
  #get 'auth/twitter', to: 'sessions#create',:as => 'login'
  match 'auth/twitter/callback' => 'sessions#create',:as => 'callback', :via => :get
  get '/profile', to: 'sessions#show', as: 'show'
  match 'logout' => 'sessions#destroy'
  resources :books do
    resources :reviews
  end
  resources :readers
  root :to => redirect('/books')
end
