Rails.application.routes.draw do
  
  post '/songs/search', to: 'songs#search'

  resources :libraries
  resources :songs
  resources :users, only: [:create, :index] do
    resources :libraries do
      resources :liked_songs
    end
  end
  resources :sessions, only: [:create, :index, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
