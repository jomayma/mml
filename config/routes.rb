Mml::Application.routes.draw do
  resources :books
  root :to => redirect('/books')
end
