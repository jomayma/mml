Mml::Application.routes.draw do
  get "welcome/home"
  get '/home', to: 'home#index', as: 'home'
  get '/top_books', to: 'home#top_books', as: 'top_books'

  #resources :sessions
  #get '/auth/twitter/callback', to: 'sessions#create', as: 'callback'
  #get 'auth/twitter', to: 'sessions#create', as: 'login'
  #match 'auth/:provider/callback' => 'sessions#create',:as => 'login'
  get '/auth/:provider/callback', to: 'sessions#create', as: 'login'
  get '/profile', to: 'sessions#show', as: 'show'
  match 'logout' => 'sessions#destroy'
  delete '/signout', to: 'sessions#destroy', as: 'signout'
  
  get '/user_books', to: 'books#user', as: 'user_books'
  get '/user_reviews', to: 'reviews#user', as: 'user_reviews'
  get '/reviews', to: 'reviews#all', as: 'reviews'

  post '/books/search_gbdb'
  get '/books/new_from_gbdb'
  get '/books/search_gbdb/:search_terms', to: 'books#search_gbdb', :as => 'search_gbdb'
  
  resources :books do
    resources :reviews
  end

  resources :readers
  #root :to => redirect('/books')
  root :to => redirect('/home')
  

end
