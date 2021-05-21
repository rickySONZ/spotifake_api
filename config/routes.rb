Rails.application.routes.draw do
  resources :liked_songs
  resources :libraries
  resources :songs
  resources :users, only: [:create, :index]
  resources :sessions, only: [:create, :index, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
