Mml::Application.routes.draw do
  #resources :sessions
  match 'auth/:provider/callback' => 'sessions#create',:as => 'login', :via => :get
  match 'logout' => 'sessions#destroy'
  resources :books do
    resources :reviews
  end
  resources :readers
  root :to => redirect('/books')
end
