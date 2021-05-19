Rails.application.routes.draw do
  resources :users, only: [:create, :index]
  resources :sessions, only: [:create, :delete, :new]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
