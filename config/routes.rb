Mml::Application.routes.draw do
  resources :books do
    resources :reviews
  end
  resources :readers
  root :to => redirect('/books')
end
