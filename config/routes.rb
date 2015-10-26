Rails.application.routes.draw do
  devise_for :users
  resources :books do
  resources :books,only: [:create]
  resources :reviews

  end
  root 'books#index'
end
