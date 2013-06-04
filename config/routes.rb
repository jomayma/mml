Mml::Application.routes.draw do
  #resources :sessions
  #get '/auth/twitter/callback', to: 'sessions#create', as: 'callback'
  match 'auth/twitter/callback' => 'sessions#create',:as => 'login', :via => :get
  match 'logout' => 'sessions#destroy'
  resources :books do
    resources :reviews
  end
  resources :readers
  root :to => redirect('/books')
end
